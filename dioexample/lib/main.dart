import 'package:dioexample/GoogleMapExample.dart';
import 'package:dioexample/LoginPage/Controller.dart';
import 'package:dioexample/LoginPage/Screen.dart';
import 'package:dioexample/Model/Product.dart';
import 'package:dioexample/ProductPage/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(LoginController());
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GoogleMapExample(),
    );
  }
}


