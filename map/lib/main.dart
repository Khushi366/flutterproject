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




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map/RegisterPage/Screen.dart';

import 'Auth/AuthRepository.dart';
import 'FirebaseExample/Register.dart';
import 'LoginPage/Screen.dart';
import 'SharedPref/AddData.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: "AIzaSyAAFKidPhL-BNJbtbU1usfyGjaYNoNl9PQ",
        appId: "1:683214306246:android:493f37f1fb7e5b46ae10c7",
        messagingSenderId: "683214306246",
        projectId: "register-f7ae7",
    )
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Home(),
     // home: FormPage(),
      home: LoginScreen(),
    );
  }
}

