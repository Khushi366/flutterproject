import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/DioExample.dart';
import 'package:getxproject/controllers/EmployeeController.dart';
import 'package:getxproject/controllers/ProductController.dart';
import 'package:getxproject/views/DataScreen.dart';
import 'package:getxproject/views/FirstScreen.dart';
import 'package:getxproject/views/ThirdScreen.dart';
import 'package:getxproject/views/product/ViewProduct.dart';

import 'DioAdd.dart';
import 'DioLogin.dart';

void main(){
  Get.put(ProductController());
  Get.put(EmployeeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DataScreen(),
   // home: DioExample(),
     // home: DioAdd(),
      home: DioLogin(),
    );
  }
}

// void main() => runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//         home: ThirdScreen())
// );
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const FirstScreen(),
//     );
//   }
// }

