import 'package:flutter/material.dart';
import 'package:gofresh/CategoryExample.dart';
import 'package:gofresh/HomePage.dart';
import 'package:gofresh/LoginExample.dart';

import 'MyCartExample.dart';
import 'ProfileExample.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: (index==0)?HomePage() :(index == 1)? CategoryExample(): (index==2)?MyCartExample():ProfileExample(),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
              color: Colors.white,

              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [

                    GestureDetector(
                        onTap : (){
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0,right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250.0),
                            color: (index == 0)?Color(0xFFFFEBE4) : Colors.transparent,
                          ),
                          child: Image.asset(
                            "assets/img/ic_home.png",
                            height: 20.0,
                            // width: 25.0,height: 25.0,
                          ),
                        ),
                      ),
                      Text("Home",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101))
                      )],
                  ),
                  Column(
                    children: [

                      GestureDetector(
                        onTap : (){
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0,right: 20.0),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250.0),
                            color: (index == 1)?Color(0xFFFFEBE4) : Colors.transparent,
                          ),
                          child: Image.asset(
                            "assets/img/ic_category.png",
                            height: 20.0,
                          ),
                        ),
                      ),
                      Text("Category",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)))
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap : (){
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0,right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250.0),
                            color: (index == 2)?Color(0xFFFFEBE4) : Colors.transparent,
                          ),
                          child: Image.asset(
                            "assets/img/cart.png",
                          height: 20.0,
                          ),
                        ),
                      ),
                      Text("Cart",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101))),
                    ],
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap : (){
                          setState(() {
                            index = 3;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0,right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(250.0),
                            color: (index == 3)?Color(0xFFFFEBE4) : Colors.transparent,
                          ),
                          child: Image.asset(
                            "assets/img/ic_profile.png",
                           height: 20.0,
                          ),
                        ),
                      ),
                      Text("Profile",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101))),
                    ],
                  ),


                ],
              ),

            ),


          ],
        ),

      ),
    );
  }
}
