import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyImagePicker());
}

class MyImagePicker extends StatefulWidget {
  MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<MyImagePicker> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      setState(() {
        _image = (pickedFile!=null)? File(pickedFile.path) : null;
      });
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker '),
        ),
        body: Center(
          child: _image == null
              ? const Text('No image selected.')
              : Image.file(_image!),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Icon(Icons.camera),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Icon(Icons.photo_library),
            ),
          ],
        ),
      ),
    );
  }
}
  