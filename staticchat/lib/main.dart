import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:staticchat/Auth/Login.dart';
import 'package:staticchat/Utility/Home.dart';
import 'package:staticchat/firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
     // home: ChatScreen(),
      home: Home(),
    );
  }
}

