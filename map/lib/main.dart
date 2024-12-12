// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'Camera/TakePitcherScreen.dart';
// import 'MyHomePage/Home.dart';
//
// Future<void> main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//
//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }
//




import 'package:flutter/material.dart';

import 'FromPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Home(),
      home: FormPage(),
    );
  }
}

