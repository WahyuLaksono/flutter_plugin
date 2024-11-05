import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:plugin_test/widget/displaypicture_screen.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen ({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
    widget.camera,
    ResolutionPreset.low,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    final captureFolder = Directory('${directory.path}/hasil_capture');

    if (!await captureFolder.exists()) {
      await captureFolder.create(recursive: true);
    }

    return captureFolder.path;
  }

  Future<File> _moveFile(XFile file) async {
    final localPath = await _getLocalPath();
    final fileName = path.basename(file.path);
    final newPath = path.join(localPath, fileName);
    return File(file.path).copy(newPath);
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Take a picture - 362358302107')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),

        floatingActionButton:  FloatingActionButton(
          onPressed:() async{
            try{
              await _initializeControllerFuture;
              final image = await _controller.takePicture();

              final savedImage= await _moveFile(image);

              if (!context.mounted) return;

              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(
                    imagePath: savedImage.path
                    )
                  ),
              );
            } catch(e) {
              print(e);
            }

          },

          child: const Icon(Icons.camera_alt),

        )

    );
  }
}