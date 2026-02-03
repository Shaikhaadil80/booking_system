import 'package:flutter/material.dart';
import 'cloudinary_service.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final TextEditingController _folderNameController = TextEditingController();
  List<String> _uploadedImages = [];
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  int _totalImages = 0;
  int _uploadedCount = 0;

  Future<void> _uploadImages() async {
    if (_folderNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter folder name')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
      _uploadedImages.clear();
    });

    try {
      final results = await CloudinaryService.uploadBulkImages(
        folderName: _folderNameController.text.toLowerCase(),
      );

      setState(() {
        _uploadedImages = results.map((r) => r['secure_url'] as String).toList();
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully uploaded ${results.length} images'),
        ),
      );
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: _uploadProgress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          'Uploading $_uploadedCount/$_totalImages images...',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    if (_uploadedImages.isEmpty) {
      return const Center(
        child: Text(
          'No images uploaded yet',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: _uploadedImages.length,
      itemBuilder: (context, index) {
        return Image.network(
          _uploadedImages[index],
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulk Image Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Folder Name Input
            TextField(
              controller: _folderNameController,
              decoration: const InputDecoration(
                labelText: 'Folder Name',
                hintText: 'e.g., product_images',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.folder),
              ),
            ),
            const SizedBox(height: 20),
            
            // Upload Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isUploading ? null : _uploadImages,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Upload Images'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Progress Indicator
            if (_isUploading) _buildProgressIndicator(),
            
            // Images Grid
            Expanded(
              child: _buildImageGrid(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _folderNameController.dispose();
    super.dispose();
  }
}