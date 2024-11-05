import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:plugin_test/red_text_widget.dart';
import 'package:plugin_test/widget/takepicture_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  // final secondcamera = cameras.last;


  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );

}
