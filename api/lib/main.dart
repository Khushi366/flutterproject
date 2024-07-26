import 'package:flutter/material.dart';

import 'CustomDrawer.dart';
import 'DropDownExample.dart';
import 'FakeProduct.dart';
import 'Login.dart';
import 'LoginExample.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
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
     // home: Login(),
    //  home: LoginExample(),
      home: SplashScreen(),
    );
  }
}


