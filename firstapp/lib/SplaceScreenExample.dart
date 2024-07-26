import 'package:firstapp/BankPinCreatExample.dart';
import 'package:firstapp/BankpinLoginExample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HorizontalListviewExample.dart';

class SplaceScreenExample extends StatefulWidget {

   SplaceScreenExample({super.key,});

  @override
  State<SplaceScreenExample> createState() => _SplaceScreenExampleState();
}

class _SplaceScreenExampleState extends State<SplaceScreenExample> {

  String ? storedPin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checklogin();
    });
  }

  checklogin()async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("pin"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BankpinLoginExample()));
      }
      else
        {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BankPinCreatExample()));
        }
  }

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey("isLogin")) {
    //   Navigator.of(context).pop();
    //   Navigator.of(context).push(
    //       MaterialPageRoute(builder: (context) => HorizontalListviewExample()));
    // }
    // else {
    //   storedPin = prefs.getString("pin");
    //   Navigator.of(context).pop();
    //
    //   // Navigator.of(context).push(MaterialPageRoute(
    //   //     builder: (context) =>
    //   //         BankpinLoginExample(storedPin: storedPin ?? "")));
    // }
  //}



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          children: [
            Container(
              color: Color(0xFFFBF0E8),
              child: Image.asset("assets/img/yes_bank.png",
                fit: BoxFit.fill,
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

                  ],
                ),
              ),
            ),
          ]
      ),
    );

  }
}
