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

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//        _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
      
//       appBar: AppBar(
//          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//          title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               color: Colors.yellowAccent,
//               width: 50,
//               child: const RedTextWidget(
//                 text: 'You have pushed the button this many times:',
//               ),
//             ),

//             Container(
//               color: Colors.greenAccent,
//               width: 100,
//               child: const Text(
//                 'You have pushed the button this many times:',
//               ),
//             ),

//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

