import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permissionapp/FirstScreenAnimation.dart';
import 'package:permissionapp/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'IntroductionScreen.dart';
import 'MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("islogin")) {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage()));

    }
    else if(prefs.containsKey("Welcomeuser"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));

    }
    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("Welcomeuser", "yes");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnBoardingPage()));
    }
  }





  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      checkLogin();

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Image.network(
              "https://images-platform.99static.com/3igScTLS0AUxOcYp7Hiv9nYYW4E=/500x500/top/smart/99designs-contests-attachments/32/32549/attachment_32549462",
            ),
          ),
        ),
      ),
    );
  }
}
