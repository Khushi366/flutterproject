import 'package:flutter/material.dart';
import 'package:propsmart/providers/CheckLoginProvider.dart';
import 'package:propsmart/providers/EmployeeProvider.dart';
import 'package:propsmart/providers/ProductProvider.dart';
import 'package:propsmart/views/auth/Login.dart';
import 'package:propsmart/views/utility/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>EmployeeProvider()),
        ChangeNotifierProvider(create: (context)=>CheckLoginProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

