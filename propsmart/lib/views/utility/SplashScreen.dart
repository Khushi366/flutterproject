import 'package:flutter/material.dart';
import 'package:propsmart/views/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

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
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
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
      backgroundColor: Color(0xFF233645),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Stack(
              children: [
                Image.asset("assets/img/p.png",width: 125.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0,left: 22.0),
                      child: Text("PropSmarts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),),
                    ),
                  ],
                )
              ],),
          ],
        ),
      ),
    );
  }
}
