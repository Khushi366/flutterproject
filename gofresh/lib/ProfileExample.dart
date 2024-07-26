import 'package:flutter/material.dart';
import 'package:gofresh/LoginExample.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileExample extends StatefulWidget {
  const ProfileExample({super.key});

  @override
  State<ProfileExample> createState() => _ProfileExampleState();
}

class _ProfileExampleState extends State<ProfileExample> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFFFBFAFF),
      alignment: Alignment.topRight,
      child: Opacity(
          opacity: 0.10,
          child: Image.asset("assets/img/vegitablegroup.png")),
    ),
       Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                      Text("Profile",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),
                      GestureDetector(
                        onTap: () async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.clear();

                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginExample()));
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Color(0xFFFE7551),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Image.asset("assets/img/ic_logout.png", scale: 1.8,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33,),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage("assets/img/Mask group (2).png"),
                          )
                        ],
                      ),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ana Itonishvili",style: TextStyle(fontFamily: "Semibold",fontSize: 18.0),),
                          Text("anaitonishvili35@gmail.com",style: TextStyle(fontFamily: "Regular",fontSize: 16.0,color: Color(0xFFC0C0C0))),

                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 30.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                      width: double.infinity,
                      //height: 45.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFC0C0C0).withOpacity(0.4),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: Offset(0.5, 0.5),
                            ),
                            BoxShadow(
                              color: Color(0xFFC0C0C0).withOpacity(0.4),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: Offset(-0.5, -0.5),
                            ),
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/img/ic_profile (1).png",scale: 1.5,),
                              SizedBox(width: 5,),
                              Text("My Profile",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                            ],
                          ),

                        ],
                      ),
                  ),
                  SizedBox(height: 18.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/cart (1).png",scale: 1.5,),
                            SizedBox(width: 5,),
                            Text("My Order",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 18.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/ic_card.png",scale: 1.5,),
                            SizedBox(width: 5,),
                            Text("My Cards",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 18.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/ic_address.png",scale: 1.5,),
                            SizedBox(width: 5,),
                            Text("Shipping Address",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 18.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/ic_wishlist.png",scale: 1.5,),
                            SizedBox(width: 5,),
                            Text("Wishlist",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 18.0,),

                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/img/ic_setting.png",scale: 1.5,),
                            SizedBox(width: 5,),
                            Text("Settings",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101))),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/img/ic_back_arrow (1).png",scale: 1.5,),
                          ],
                        ),

                      ],
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),

      ),
      ],
    );
  }
}
