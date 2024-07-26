import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Theme/AppTheme.dart';
import 'views/utility/SplashScreen/Screen.dart';

// void main() => runApp(
//
//     GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.light,
//         home: SplashScreen()),
// );
void main() {
    WidgetsFlutterBinding.ensureInitialized();

    // Lock the orientation to portrait mode
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]).then((_) {
        runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            home: SplashScreen(),
        );
    }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

