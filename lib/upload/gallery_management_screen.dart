import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'cloudinary_service.dart';

class GalleryManagementScreen extends StatefulWidget {
  const GalleryManagementScreen({Key? key}) : super(key: key);

  @override
  State<GalleryManagementScreen> createState() => _GalleryManagementScreenState();
}

class _GalleryManagementScreenState extends State<GalleryManagementScreen> {
  // All images data
  List<Map<String, dynamic>> _allImages = [];
  bool _isLoading = true;
  bool _isDeleting = false;
  bool _showFolders = false;
  
  // Search functionality
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  
  // Filter options
  String _selectedFolder = 'All Folders';
  List<String> _availableFolders = ['All Folders'];
  
  @override
  void initState() {
    super.initState();
    _loadAllImages();
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  // Load all images from Firebase
  Future<void> _loadAllImages() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      // Get all folders from the 'allpics' collection
      final foldersSnapshot = await FirebaseFirestore.instance
          .collection('allpics')
          .get();
      
      List<Map<String, dynamic>> allImages = [];
      Set<String> folderSet = {'All Folders'};
      
      // For each folder, get its images
      for (var folderDoc in foldersSnapshot.docs) {
        final folderData = folderDoc.data();
        final folderName = folderData['folder_name']?.toString() ?? folderDoc.id;
        final sanitizedFolderName = folderData['sanitized_folder_name']?.toString() ?? folderDoc.id;
        
        // Add folder to filter list
        if (folderName.isNotEmpty) {
          folderSet.add(folderName);
        }
        
        // Get images from this folder's 'pics' subcollection
        try {
          final imagesSnapshot = await FirebaseFirestore.instance
              .collection('allpics')
              .doc(sanitizedFolderName)
              .collection('pics')
              .orderBy('uploaded_at', descending: true)
              .get();
          
          // Add folder info to each image
          for (var imageDoc in imagesSnapshot.docs) {
            final imageData = imageDoc.data();
            allImages.add({
              ...imageData,
              'id': imageDoc.id,
              'folder_doc_id': sanitizedFolderName,
              'folder_name': folderName,
              'sanitized_folder_name': sanitizedFolderName,
              'firestore_doc_path': 'allpics/$sanitizedFolderName/pics/${imageDoc.id}',
            });
          }
        } catch (e) {
          print('Error loading images for folder $folderName: $e');
          // Continue with other folders
        }
      }
      
      setState(() {
        _allImages = allImages;
        _availableFolders = folderSet.toList();
        _isLoading = false;
      });
      
    } catch (e) {
      print('Error loading images: $e');
      setState(() {
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load images: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
  
  // Filter images based on search query and folder filter
  List<Map<String, dynamic>> get _filteredImages {
    List<Map<String, dynamic>> filtered = _allImages;
    
    // Apply folder filter
    if (_selectedFolder != 'All Folders') {
      filtered = filtered.where((image) {
        final folderName = image['folder_name']?.toString() ?? '';
        return folderName == _selectedFolder;
      }).toList();
    }
    
    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((image) {
        final filename = (image['local_filename'] ?? '').toLowerCase();
        final folder = (image['folder_name'] ?? '').toLowerCase();
        final originalFilename = (image['original_filename'] ?? '').toLowerCase();
        final publicId = (image['public_id'] ?? '').toLowerCase();
        
        return filename.contains(query) ||
               folder.contains(query) ||
               originalFilename.contains(query) ||
               publicId.contains(query);
      }).toList();
    }
    
    return filtered;
  }
  
  // Get unique folders from images
  List<String> get _uniqueFoldersFromImages {
    final folders = _allImages
        .map((image) => image['folder_name']?.toString() ?? 'Unknown')
        .where((folder) => folder.isNotEmpty)
        .toSet()
        .toList();
    
    folders.sort();
    return ['All Folders', ...folders];
  }
  
  // Delete image with confirmation
  Future<void> _deleteImage(Map<String, dynamic> image) async {
    final folderName = image['folder_name']?.toString() ?? '';
    final publicId = image['public_id']?.toString() ?? '';
    final imageId = image['id']?.toString() ?? '';
    final imageName = image['local_filename']?.toString() ?? 'Unknown';
    final firestorePath = image['firestore_doc_path']?.toString() ?? '';
    
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you sure you want to delete "$imageName"?',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Folder: $folderName',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Public ID: ${publicId.length > 20 ? '${publicId.substring(0, 20)}...' : publicId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'This image will be deleted from:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(child: Text('Cloudinary storage')),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text('Firebase: $firestorePath')),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '⚠️ This action cannot be undone!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete Permanently'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    setState(() {
      _isDeleting = true;
    });
    
    try {
      // Delete from Cloudinary and Firebase
      await CloudinaryService.deleteImage(
        folderName: folderName,
        publicId: publicId,
        imageId: imageId,
      );
      
      // Remove from local list
      setState(() {
        _allImages.removeWhere((img) => img['id'] == imageId);
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✓ Image "$imageName" deleted successfully'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      
    } catch (e, stackTrace) {
      print('Error deleting image: $e');
      print('Stack trace: $stackTrace');
      
      // Try to delete just from Firebase if Cloudinary fails
      try {
        // Delete from Firebase only
        await FirebaseFirestore.instance
            .collection('allpics')
            .doc(image['sanitized_folder_name']?.toString())
            .collection('pics')
            .doc(imageId)
            .delete();
        
        // Update folder count
        final folderDoc = await FirebaseFirestore.instance
            .collection('allpics')
            .doc(image['sanitized_folder_name']?.toString())
            .get();
        
        if (folderDoc.exists) {
          await FirebaseFirestore.instance
              .collection('allpics')
              .doc(image['sanitized_folder_name']?.toString())
              .update({
                'total_images': FieldValue.increment(-1),
                'updated_at': FieldValue.serverTimestamp(),
              });
        }
        
        // Remove from local list
        setState(() {
          _allImages.removeWhere((img) => img['id'] == imageId);
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '⚠️ Image removed from database but may still exist in Cloudinary: $e',
            ),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 5),
          ),
        );
        
      } catch (firebaseError) {
        print('Firebase delete also failed: $firebaseError');
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to delete image: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      setState(() {
        _isDeleting = false;
      });
    }
  }
  
  // Delete multiple images
  Future<void> _deleteMultipleImages(List<Map<String, dynamic>> images) async {
    final count = images.length;
    
    if (count == 0) return;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Multiple Images'),
        content: Text(
          'Are you sure you want to delete $count images?'
          '\n\nThis action cannot be undone!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('Delete ($count)'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    setState(() {
      _isDeleting = true;
    });
    
    int successCount = 0;
    int failCount = 0;
    
    for (var image in images) {
      try {
        final folderName = image['folder_name']?.toString() ?? '';
        final publicId = image['public_id']?.toString() ?? '';
        final imageId = image['id']?.toString() ?? '';
        
        await CloudinaryService.deleteImage(
          folderName: folderName,
          publicId: publicId,
          imageId: imageId,
        );
        
        successCount++;
        
        // Update UI progressively
        setState(() {
          _allImages.removeWhere((img) => img['id'] == imageId);
        });
        
      } catch (e) {
        print('Failed to delete image ${image['local_filename']}: $e');
        failCount++;
      }
    }
    
    setState(() {
      _isDeleting = false;
    });
    
    String message = 'Deleted $successCount images';
    if (failCount > 0) {
      message += ', $failCount failed';
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: failCount > 0 ? Colors.orange : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }
  
  // Get file size in readable format
  String _getFileSize(dynamic bytesValue) {
    try {
      final bytes = bytesValue is int ? bytesValue : int.tryParse(bytesValue.toString()) ?? 0;
      if (bytes < 1024) return '$bytes B';
      if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } catch (_) {
      return 'Unknown';
    }
  }
  
  // Format date
  String _formatDate(dynamic dateValue) {
    try {
      if (dateValue == null) return 'Unknown';
      final dateString = dateValue.toString();
      final date = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd HH:mm').format(date);
    } catch (_) {
      return dateValue?.toString() ?? 'Unknown';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final filteredImages = _filteredImages;
  final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Management'),
        backgroundColor: const Color(0xFFFF6B35),
        foregroundColor: Colors.white,
        actions: [
          if (_isDeleting)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading || _isDeleting ? null : _loadAllImages,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters and Search
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[50],
            child: Column(
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search images...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                
                const SizedBox(height: 12),
                
                // Folder filter
                Row(
                  children: [
                    const Icon(Icons.folder, size: 20, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Text('Filter by folder:'),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedFolder,
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: _uniqueFoldersFromImages.map((folder) {
                            return DropdownMenuItem<String>(
                              value: folder,
                              child: Text(
                                folder,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: folder == 'All Folders' 
                                      ? Colors.blue[800]
                                      : Colors.grey[800],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedFolder = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Stats
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: ${_allImages.length} images',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    if (_searchQuery.isNotEmpty || _selectedFolder != 'All Folders')
                      Row(
                        children: [
                          Text(
                            'Showing: ${filteredImages.length}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF6B35),
                            ),
                          ),
                          if (_searchQuery.isNotEmpty || _selectedFolder != 'All Folders')
                            TextButton(
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                  _selectedFolder = 'All Folders';
                                });
                              },
                              child: const Text('Clear filters'),
                            ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          
          // Loading indicator
          if (_isLoading)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B35)),
                      strokeWidth: 3,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Loading images from Cloudinary...',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please wait',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (filteredImages.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _searchQuery.isEmpty && _selectedFolder == 'All Folders'
                          ? Icons.photo_library_outlined
                          : Icons.search_off,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _searchQuery.isEmpty && _selectedFolder == 'All Folders'
                          ? 'No images found in gallery'
                          : 'No images matching your criteria',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _searchQuery.isEmpty && _selectedFolder == 'All Folders'
                          ? 'Upload images using the Cloudinary service'
                          : 'Try changing your search or filter',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                    if (_searchQuery.isNotEmpty || _selectedFolder != 'All Folders')
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                              _selectedFolder = 'All Folders';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6B35),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Show All Images'),
                        ),
                      ),
                  ],
                ),
              ),
            )
          else
            // Image grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 5 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredImages.length,
                itemBuilder: (context, index) {
                  final image = filteredImages[index];
                  final imageUrl = image['image_url']?.toString() ?? '';
                  final fileName = image['local_filename']?.toString() ?? 'Unknown';
                  final folderName = image['folder_name']?.toString() ?? 'Unknown';
                  final fileSize = _getFileSize(image['bytes']);
                  final uploadDate = _formatDate(image['uploaded_at']);
                  final compressionQuality = image['compression_quality']?.toString() ?? '50%';
                  final dimensions = '${image['width'] ?? '?'}×${image['height'] ?? '?'}';
                  final publicId = image['public_id']?.toString() ?? '';
                  
                  return _buildImageCard(
                    imageUrl: imageUrl,
                    fileName: fileName,
                    folderName: folderName,
                    fileSize: fileSize,
                    uploadDate: uploadDate,
                    compressionQuality: compressionQuality,
                    dimensions: dimensions,
                    publicId: publicId,
                    onDelete: () => _deleteImage(image),
                  );
                },
              ),
            ),
        ],
      ),
      // floatingActionButton: filteredImages.length > 3
      //     ? FloatingActionButton.extended(
      //         onPressed: _isDeleting ? null : () {
      //           _deleteMultipleImages(filteredImages.sublist(0, 3));
      //         },
      //         backgroundColor: Colors.red,
      //         foregroundColor: Colors.white,
      //         icon: const Icon(Icons.delete_sweep),
      //         label: const Text('Delete First 3'),
      //         tooltip: 'Delete first 3 images (for testing)',
      //       )
      //     : null,
    );
  }
  
  Widget _buildImageCard({
    required String imageUrl,
    required String fileName,
    required String folderName,
    required String fileSize,
    required String uploadDate,
    required String compressionQuality,
    required String dimensions,
    required String publicId,
    required VoidCallback onDelete,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Show image details
          _showImageDetails(
            imageUrl: imageUrl,
            fileName: fileName,
            folderName: folderName,
            fileSize: fileSize,
            uploadDate: uploadDate,
            compressionQuality: compressionQuality,
            dimensions: dimensions,
            publicId: publicId,
            onDelete: onDelete,
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                    // child: CachedNetworkImage(
                      // imageUrl: imageUrl,
                      imageUrl,
                      fit: BoxFit.cover,
                      // placeholder: (context, url) => Container(
                      //   color: Colors.grey[100],
                      //   child: const Center(
                      //     child: CircularProgressIndicator(
                      //       strokeWidth: 2,
                      //       valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B35)),
                      //     ),
                      //   ),
                      // ),
                      // errorWidget: (context, url, error) => Container(
                      //   color: Colors.grey[100],
                      //   child: const Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.broken_image,
                      //           color: Colors.grey,
                      //           size: 40,
                      //         ),
                      //         SizedBox(height: 8),
                      //         Text(
                      //           'Failed to load',
                      //           style: TextStyle(
                      //             fontSize: 10,
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
                
                // Image info
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                    border: Border.all(color: Colors.grey[200]!, width: 0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Filename
                      Text(
                        fileName.length > 18
                            ? '${fileName.substring(0, 15)}...'
                            : fileName,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Folder and size
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.folder,
                                  size: 12,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    folderName,
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            fileSize,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 2),
                      
                      // Compression and dimensions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            compressionQuality,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            dimensions,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 2),
                      
                      // Upload date
                      Text(
                        uploadDate,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: Colors.grey[500],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Delete button
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: _isDeleting ? null : onDelete,
                  tooltip: 'Delete image',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
            
            // Public ID badge
            if (publicId.isNotEmpty)
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ID',
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  void _showImageDetails({
    required String imageUrl,
    required String fileName,
    required String folderName,
    required String fileSize,
    required String uploadDate,
    required String compressionQuality,
    required String dimensions,
    required String publicId,
    required VoidCallback onDelete,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image preview
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 300,
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              
              // Details
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Image Details',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Details grid
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        _buildDetailRow('File Name', fileName),
                        _buildDetailRow('Folder', folderName),
                        _buildDetailRow('File Size', fileSize),
                        _buildDetailRow('Dimensions', dimensions),
                        _buildDetailRow('Compression', compressionQuality),
                        _buildDetailRow('Upload Date', uploadDate),
                        _buildDetailRow('Public ID', publicId.length > 30 
                            ? '${publicId.substring(0, 30)}...' 
                            : publicId),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              onDelete();
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.delete, size: 18),
                                SizedBox(width: 8),
                                Text('Delete Image'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6B35),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  TableRow _buildDetailRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '$label:',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}