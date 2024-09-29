import 'package:ecommerceapp/Theme/AppString.dart';
import 'package:ecommerceapp/View/Auth/LoginPage/Screen.dart';
import 'package:ecommerceapp/View/Utility/SplashScreen/Screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is fully initialized before running the app.
  // Check if the app is running on the web
  if (kIsWeb) {
    print("This application does not run on the web.");
    return;
  }
  // If not running on web, set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow portrait mode
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft, // Allow landscape mode
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp()); // Run the app once orientation preferences are set.
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: fontPoppinsRegular,
        useMaterial3: true,
      ),
      initialRoute: '/', // Set initial route to SplashScreen
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),  // SplashScreen as initial screen
        GetPage(name: '/login', page: () => LoginScreen()),  // LoginScreen route
      ],
    );
  }
}
