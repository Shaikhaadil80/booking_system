import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
// FIX: Added prefix 'as cld_sdk' to avoid conflict with CloudinaryResponse
import 'package:cloudinary_sdk/cloudinary_sdk.dart' as cld_sdk;

class CloudinaryService {
  // Cloudinary configuration
  
  static final String ? _cloudName =  dotenv.env['CLOUD_NAME'];
  static final String ? _apiKey = dotenv.env['API_KEY'];
  static final String ? _apiSecret = dotenv.env['API_SECRET'];
  static final String ? _uploadPreset = dotenv.env['UPLOAD_PRESET'];
  
  // Firebase collections
  static const String _firebaseCollection = 'allpics';
  static const String _picsSubCollection = 'pics';
  
  // UUID generator for unique document IDs
  static final Uuid _uuid = Uuid();
  
  // Cloudinary client instance
  static late CloudinaryPublic _cloudinary;
  
  // Initialize Cloudinary
  static void _initializeCloudinary() {
    _cloudinary = CloudinaryPublic(
      _cloudName??'',
      _uploadPreset?? '',
      cache: false,
    );
  }
  
  // Upload multiple images with 50% compression
  static Future<List<Map<String, dynamic>>> uploadBulkImages({
    required String folderName,
    List<XFile>? imageFiles,
    bool isWeb = kIsWeb,
    Function(double)? onProgress,
    int quality = 50, // 50% compression by default
  }) async {
    try {
      // Initialize Cloudinary if not already done
      try {
        _cloudinary;
      } catch (_) {
        _initializeCloudinary();
      }
      
      // If no files provided, pick them
      if (imageFiles == null) {
        imageFiles = await _pickImages(isWeb: isWeb);
      }
      
      if (imageFiles.isEmpty) {
        throw Exception('No images selected');
      }
      
      List<Map<String, dynamic>> uploadResults = [];
      int totalImages = imageFiles.length;
      int uploadedCount = 0;
      
      // Upload each image
      for (var imageFile in imageFiles) {
        try {
          final uploadResult = await _uploadSingleImage(
            imageFile: imageFile,
            folderName: folderName,
            isWeb: isWeb,
            quality: quality,
          );
          
          uploadResults.add(uploadResult);
          uploadedCount++;
          
          // Update progress if callback provided
          if (onProgress != null) {
            onProgress(uploadedCount / totalImages);
          }
          
        } catch (e) {
          print('Error uploading ${imageFile.name}: $e');
          // Continue with other images
        }
      }
      
      // Store all URLs in Firebase
      if (uploadResults.isNotEmpty) {
        await _storeUrlsInFirebase(
          folderName: folderName,
          uploadResults: uploadResults,
        );
      }
      
      return uploadResults;
    } catch (e) {
      print('Error in bulk upload: $e');
      rethrow;
    }
  }
  
  // Pick images based on platform
  static Future<List<XFile>> _pickImages({bool isWeb = false}) async {
    if (isWeb) {
      // For web
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      
      if (result == null || result.files.isEmpty) {
        return [];
      }
      
      // Convert web files to XFiles
      return result.files.map((file) {
        return XFile.fromData(
          file.bytes!,
          name: file.name,
          mimeType: file.extension,
        );
      }).toList();
    } else {
      // For mobile with 50% compression
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(
        imageQuality: 50, // 50% compression on pick
        maxWidth: 1920,
      );
      
      return images ?? [];
    }
  }
  
  // Upload single image to Cloudinary with compression
  static Future<Map<String, dynamic>> _uploadSingleImage({
    required XFile imageFile,
    required String folderName,
    bool isWeb = false,
    int quality = 50,
  }) async {
    try {
      // Initialize Cloudinary if not already done
      try {
        _cloudinary;
      } catch (_) {
        _initializeCloudinary();
      }
      
      print('📤 Uploading to Cloudinary with $quality% compression: ${imageFile.name}');
      
      CloudinaryResponse response;
      
      if (isWeb) {
        // For web
        final bytes = await imageFile.readAsBytes();
        final String fileName = imageFile.name.isNotEmpty 
            ? imageFile.name 
            : 'upload_${DateTime.now().millisecondsSinceEpoch}.jpg';
        
        // Create CloudinaryFile with compression transformation
        final cloudinaryFile = CloudinaryFile.fromBytesData(
          bytes,
          identifier: fileName,
          folder: folderName,
          resourceType: CloudinaryResourceType.Image,
        );
        
        // Upload file
        response = await _cloudinary.uploadFile(cloudinaryFile);
      } else {
        // For mobile
        // First compress the image if it's mobile
        final compressedFile = await _compressImageIfNeeded(
          imageFile: imageFile,
          quality: quality,
          isWeb: isWeb,
        );
        
        response = await _cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            compressedFile?.path ?? imageFile.path,
            folder: folderName,
            resourceType: CloudinaryResourceType.Image,
          ),
        );
      }
      
      // Apply compression transformation to the URL
      final optimizedUrl = _applyCompression(response.secureUrl, quality);
      
      print('✅ Upload successful: $optimizedUrl');
      
      // Extract additional info from response
      final publicId = response.publicId;
      // final format = response.format;
      // final width = response.width;
      // final height = response.height;
      // final bytes = response.bytes;
      final originalFilename = response.originalFilename;
      final createdAt = response.createdAt;
      
      return {
        'public_id': publicId,
        'secure_url': optimizedUrl,
        'original_url': response.secureUrl, // Store original URL
        'format': 'format',
        'width': 0,
        'height': 0,
        'bytes': 0,
        // 'format': format,
        // 'width': width,
        // 'height': height,
        // 'bytes': bytes,
        'original_filename': originalFilename,
        'created_at': createdAt,
        'folder': folderName,
        'uploaded_at': DateTime.now().toIso8601String(),
        'local_filename': imageFile.name,
        'compression_quality': '$quality%',
      };
    } catch (e) {
      print('❌ Error uploading image: $e');
      
      // Fallback to direct HTTP upload if CloudinaryPublic fails
      try {
        return await _uploadViaHttp(
          imageFile: imageFile,
          folderName: folderName,
          isWeb: isWeb,
          quality: quality,
        );
      } catch (httpError) {
        print('HTTP fallback also failed: $httpError');
        rethrow;
      }
    }
  }
  
  // Apply compression transformation to Cloudinary URL
  static String _applyCompression(String originalUrl, int quality) {
    try {
      final uri = Uri.parse(originalUrl);
      final pathSegments = uri.pathSegments.toList();
      
      // Find the 'upload' segment
      final uploadIndex = pathSegments.indexOf('upload');
      if (uploadIndex != -1) {
        // Remove any existing transformations
        pathSegments.removeWhere((segment) => segment.contains(','));
        
        // Insert compression transformation
        // f_auto: auto format, q_auto:good for auto quality, or specify quality
        final transformation = quality > 0 
            ? 'f_auto,q_$quality,w_1920,c_limit'
            : 'f_auto,q_auto:good,w_1920,c_limit';
        
        pathSegments.insert(uploadIndex + 1, transformation);
      }
      
      return uri.replace(pathSegments: pathSegments).toString();
    } catch (e) {
      print('⚠️ Error applying compression: $e');
      return originalUrl;
    }
  }
  
  // Fallback HTTP upload method
  static Future<Map<String, dynamic>> _uploadViaHttp({
    required XFile imageFile,
    required String folderName,
    bool isWeb = false,
    int quality = 50,
  }) async {
    try {
      final uploadUrl = 
          'https://api.cloudinary.com/v1_1/$_cloudName/image/upload';
      
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      
      // Add fields with quality transformation
      request.fields['upload_preset'] = _uploadPreset?? '';
      request.fields['folder'] = folderName;
      request.fields['timestamp'] = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
      
      // Add file
      if (isWeb) {
        final bytes = await imageFile.readAsBytes();
        final multipartFile = http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: imageFile.name,
        );
        request.files.add(multipartFile);
      } else {
        final file = File(imageFile.path);
        final multipartFile = await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: path.basename(file.path),
        );
        request.files.add(multipartFile);
      }
      
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(responseData);
      
      if (response.statusCode == 200) {
        // Apply compression to the URL
        final originalUrl = jsonResponse['secure_url'];
        final compressedUrl = _applyCompression(originalUrl, quality);
        
        return {
          'public_id': jsonResponse['public_id'],
          'secure_url': compressedUrl,
          'original_url': originalUrl,
          'format': jsonResponse['format'],
          'width': jsonResponse['width'],
          'height': jsonResponse['height'],
          'bytes': jsonResponse['bytes'],
          'original_filename': jsonResponse['original_filename'],
          'created_at': jsonResponse['created_at'],
          'folder': jsonResponse['folder'],
          'uploaded_at': DateTime.now().toIso8601String(),
          'local_filename': imageFile.name,
          'compression_quality': '$quality%',
        };
      } else {
        throw Exception('Upload failed: ${jsonResponse['error']['message']}');
      }
    } catch (e) {
      print('HTTP upload error: $e');
      rethrow;
    }
  }
  
  // Compress image before upload (for mobile)
  static Future<File?> _compressImageIfNeeded({
    required XFile imageFile,
    required int quality,
    bool isWeb = false,
  }) async {
    if (isWeb || quality >= 100) {
      return null; // No compression needed for web or full quality
    }
    
    try {
      // For mobile, we can use cloudinary_sdk for additional compression
      // FIX: Use the prefixed 'cld_sdk' alias here
      final cloudinarySdk = cld_sdk.Cloudinary.basic(cloudName: _cloudName??'');
      
      final file = File(imageFile.path);
      if (!file.existsSync()) {
        return null;
      }
      
      // You can add additional image processing here if needed
      // For now, we rely on the initial compression from ImagePicker
      return file;
    } catch (e) {
      print('Compression error: $e');
      return null;
    }
  }
  
  // Store URLs in Firebase - Updated with compression info
  static Future<void> _storeUrlsInFirebase({
    required String folderName,
    required List<Map<String, dynamic>> uploadResults,
  }) async {
    try {
      final String sanitizedFolderName = folderName
          .replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')
          .replaceAll(RegExp(r'_+'), '_')
          .trim();
      
      final folderDocRef = FirebaseFirestore.instance
          .collection(_firebaseCollection)
          .doc(sanitizedFolderName);
      
      final folderDoc = await folderDocRef.get();
      if (!folderDoc.exists) {
        await folderDocRef.set({
          'folder_name': folderName,
          'sanitized_folder_name': sanitizedFolderName,
          'created_at': FieldValue.serverTimestamp(),
          'total_images': uploadResults.length,
          'updated_at': FieldValue.serverTimestamp(),
          'compression_applied': true,
        });
      } else {
        await folderDocRef.update({
          'total_images': FieldValue.increment(uploadResults.length),
          'updated_at': FieldValue.serverTimestamp(),
          'compression_applied': true,
        });
      }
      
      final batch = FirebaseFirestore.instance.batch();
      
      for (var result in uploadResults) {
        final String publicId = result['public_id']?.toString() ?? '';
        final String imageDocId = _uuid.v4();
        
        final imageDocRef = folderDocRef
            .collection(_picsSubCollection)
            .doc(imageDocId);
        
        batch.set(imageDocRef, {
          'image_url': result['secure_url'],
          'original_url': result['original_url'],
          'public_id': publicId,
          'doc_id': imageDocId,
          'format': result['format'],
          'width': result['width'],
          'height': result['height'],
          'file_size': result['bytes'],
          'original_filename': result['original_filename'],
          'cloudinary_created_at': result['created_at'],
          'uploaded_at': result['uploaded_at'],
          'folder': result['folder'],
          'stored_at': FieldValue.serverTimestamp(),
          'local_filename': result['local_filename'],
          'folder_name': folderName,
          'sanitized_folder_name': sanitizedFolderName,
          'compression_quality': result['compression_quality'] ?? '50%',
          'is_compressed': true,
        });
      }
      
      await batch.commit();
      
      print('✅ Successfully stored ${uploadResults.length} compressed images in Firebase');
    } catch (e) {
      print('❌ Error storing in Firebase: $e');
      rethrow;
    }
  }
  
  // Helper function to sanitize document IDs
  static String _sanitizeDocumentId(String input) {
    if (input.isEmpty) return _uuid.v4();
    
    return input
        .replaceAll('/', '_')
        .replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .trim();
  }
  
  // Get all images from a specific folder
  static Stream<QuerySnapshot> getFolderImages(String folderName) {
    final String sanitizedFolderName = folderName
        .replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .trim();
    
    return FirebaseFirestore.instance
        .collection(_firebaseCollection)
        .doc(sanitizedFolderName)
        .collection(_picsSubCollection)
        .orderBy('uploaded_at', descending: true)
        .snapshots();
  }
  
  // Get folder metadata
  static Future<DocumentSnapshot> getFolderMetadata(String folderName) {
    final String sanitizedFolderName = folderName
        .replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .trim();
    
    return FirebaseFirestore.instance
        .collection(_firebaseCollection)
        .doc(sanitizedFolderName)
        .get();
  }
  
  // Delete image from Cloudinary and Firebase
  static Future<void> deleteImage({
    required String folderName,
    required String publicId,
    required String imageId,
  }) async {
    try {
      final String sanitizedFolderName = folderName
          .replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')
          .replaceAll(RegExp(r'_+'), '_')
          .trim();
      
      // Delete from Cloudinary
      final timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
      final deleteUrl = 
          'https://api.cloudinary.com/v1_1/$_cloudName/image/destroy';
      
      final response = await http.post(
        Uri.parse(deleteUrl),
        body: {
          'public_id': publicId,
          'timestamp': timestamp,
          'api_key': _apiKey,
          'upload_preset': _uploadPreset,
        },
      );
      
      if (response.statusCode == 200) {
        // Delete from Firebase
        await FirebaseFirestore.instance
            .collection(_firebaseCollection)
            .doc(sanitizedFolderName)
            .collection(_picsSubCollection)
            .doc(imageId)
            .delete();
        
        // Update folder count
        await FirebaseFirestore.instance
            .collection(_firebaseCollection)
            .doc(sanitizedFolderName)
            .update({
              'total_images': FieldValue.increment(-1),
              'updated_at': FieldValue.serverTimestamp(),
            });
      }
    } catch (e) {
      print('Error deleting image: $e');
      rethrow;
    }
  }
  
  // Utility method to get optimized image URL with specific compression
  static String getOptimizedUrl(String originalUrl, {int quality = 50}) {
    return _applyCompression(originalUrl, quality);
  }
  
  // Utility method to get thumbnail URL
  static String getThumbnailUrl(String originalUrl, {int width = 200, int height = 200}) {
    try {
      final uri = Uri.parse(originalUrl);
      final pathSegments = uri.pathSegments.toList();
      
      final uploadIndex = pathSegments.indexOf('upload');
      if (uploadIndex != -1) {
        pathSegments.removeWhere((s) => s.contains(','));
        
        pathSegments.insert(
          uploadIndex + 1,
          'f_auto,q_auto:good,w_$width,h_$height,c_fill',
        );
      }
      
      return uri.replace(pathSegments: pathSegments).toString();
    } catch (e) {
      return originalUrl;
    }
  }
}
