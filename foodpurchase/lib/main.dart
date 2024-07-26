
import 'package:flutter/material.dart';
import 'package:foodpurchase/HomeScreen.dart';

import 'Recipe/AddRecipe.dart';
import 'Recipe/DateFormatingExample.dart';
import 'Recipe/ViewRecipe2.dart';

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
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homescreen(),
        // https://dummyjson.com/docs/recipes#recipes-all
    );
  }
}

