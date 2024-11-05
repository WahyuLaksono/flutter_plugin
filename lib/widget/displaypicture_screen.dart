import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart'; 

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
      ),
      body: Center(
        child: Image.file(File(imagePath))
      ),
    );
  }
}