import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'HomePageExample.dart';

class SplashScreenExample extends StatefulWidget {
  const SplashScreenExample({super.key});

  @override
  State<SplashScreenExample> createState() => _SplashScreenExampleState();
}

class _SplashScreenExampleState extends State<SplashScreenExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageExample()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEF4641),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/splash.png",height: 120.0,),
            Text("Expense Manager App",style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),

    );
  }
}
