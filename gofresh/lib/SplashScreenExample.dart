import 'package:flutter/material.dart';
import 'package:gofresh/LoginExample.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeExample.dart';

class SplashScreenExample extends StatefulWidget {
  const SplashScreenExample({super.key});

  @override
  State<SplashScreenExample> createState() => _SplashScreenExampleState();
}

class _SplashScreenExampleState extends State<SplashScreenExample> {


  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeExample()));
      }
    else
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginExample()));
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checklogin();
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Color(0xFFFBF0E8),
            child: Image.asset("assets/img/flat-lay-vegetables-frame-with-copy-space 1.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
      
            ),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Container(
                    width: 140.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 1.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 1.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ],
                      borderRadius: BorderRadius.circular(30.0),
                      // image: DecorationImage(
                      //   image: AssetImage("assets/img/logo.png",),
                      //   scale: 4
                      //
                      // )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/logo.png",width: 55.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginExample()));
                                  },
                                  child: Text("GoFresh",style: TextStyle(fontFamily: "Semibold",color: Color(0xFF000000),fontSize: 20.0,),)),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),
                ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
