import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/Utility/HomePage.dart';
import 'package:todolist/Utility/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();// Ensure Flutter is fully initialized before running the app.
  SystemChrome.setPreferredOrientations([]).then((_) {// Allow both portrait and landscape orientations by passing an empty list.
    runApp(MyApp());// Run the app once orientation preferences are set.
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

