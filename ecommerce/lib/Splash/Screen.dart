
import 'package:ecommerce/login/Screen.dart';
import 'package:ecommerce/navigationpage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MyHomePage/Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  checklogin() async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey("islogin"))

    {
      Navigator.of(context).pop();
      Get.to(NavigationScreen());
    }
    else
    {
      Navigator.of(context).pop();
      Get.to(LoginScreen());


    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      checklogin();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhiImUGMl_9Qb-lg5hcvcPRljEZOaWomDCzQ&s")
        ],
      ),
    );
  }
}
