import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Theme/AppColor.dart';
import 'package:self_practice/Utility/MyHomePage/Screen.dart';
import 'package:self_practice/View/Auth/Login/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checklogin() async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("isLogin"))
    {
      Get.off(() => HomeScreen());
    }
    else
    {
      Get.off(() => LoginScreen());
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
      backgroundColor: kAppBarColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Stack(
              children: [
              //  Image.asset("assets/img/p.png",width: 125.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0,left: 22.0),
                      child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
