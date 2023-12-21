import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_ai/blocs/bloc/media_bloc.dart';
import 'package:hear_ai/models/media_item_model.dart';
import 'package:image_picker/image_picker.dart';

class MediaUploadScreen extends StatefulWidget {
  const MediaUploadScreen({super.key});

  @override
  State<MediaUploadScreen> createState() => _MediaUploadScreenState();
}

class _MediaUploadScreenState extends State<MediaUploadScreen> {
  late TextEditingController _descriptionController;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  Future<void> _uploadMedia() async {
    final pickedFile = await _picker.pickMedia();
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveMedia() async {
    if (_selectedImage != null) {
      context.read<MediaBloc>().add(AddMedia(
              mediaItem: MediaItemModel(
            id: DateTime.now().toString(),
            mediaUrl: _selectedImage!.path,
            description: _descriptionController.text,
            isVideo: _selectedImage!.path.contains('.mp4') ||
                _selectedImage!.path.contains('.m3u8') ||
                _selectedImage!.path.contains('.m4v'),
          )));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _uploadMedia,
              child: _selectedImage != null
                  ? Image.file(_selectedImage!, height: 150, fit: BoxFit.cover)
                  : Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.add_a_photo),
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveMedia,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
