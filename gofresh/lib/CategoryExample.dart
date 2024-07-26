import 'package:flutter/material.dart';
import 'package:gofresh/LoginExample.dart';

import 'CategoryInside.dart';

class CategoryExample extends StatefulWidget {
  const CategoryExample({super.key});

  @override
  State<CategoryExample> createState() => _CategoryExampleState();
}

class _CategoryExampleState extends State<CategoryExample> {
  var index = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Stack(
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
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                  Text("Shop By Categories",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),
                  Image.asset("assets/img/top bar.png", width: 45.0, height: 45.0,fit: BoxFit.cover,),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryInside()));
                                  },

                                  child: Container(
                                    padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                    decoration: BoxDecoration(
                                        color: Color(0xFFE2F5FF),
                                        borderRadius: BorderRadius.circular(25.0)
                                    ),
                                    child: Image.asset("assets/img/vegetables.png",width: 125,height: 125,),

                                  ),
                                ),
                                SizedBox(height: 5.0 ),

                                Text("Vegetables",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFFFEBE6),

                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/dl.beatsnoop1.png",width: 125,height: 125,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Fruits",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFFFF4D8),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/dl.beatsnoop2.png",width: 125,height: 125,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Bakery",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EEFF),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/atta-mainda_banner.png",width: 125,height: 125,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Atta & maida",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFEDEFFF),

                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Ohho-Categories_App 3.png",width: 125,height: 125,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Beverages",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE3F8E0),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Snakcs 1.png",width: 125,height: 125,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Snacks",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFE2F5FF),

                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Ohho-Categories_App 2.png",width: 125,height: 125,),


                              ),
                              SizedBox(height: 5.0 ),
                              Text("Baby Care",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFEBE6),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Ohho-Categories_App 4.png",width: 133,height: 128,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Personal Care",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFF4D8),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Ohho-Categories_App 5.png",width: 133,height: 128,),
                              ),
                              SizedBox(height: 5.0 ),
                              Text("House Cleaning",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE3F8E0),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/dal-Pulses1.png",width: 133,height: 128,),
                              ),

                              SizedBox(height: 5.0 ),
                              Text("Dal & pulses",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),

                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EEFF),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Noodles & Pasta 1.png",width: 133,height: 128,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Noodles & Pasta",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0,right: 10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE2F5FF),

                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Image.asset("assets/img/Group 167 1.png",width: 133,height: 128,),

                              ),
                              SizedBox(height: 5.0 ),
                              Text("Mask & sanitisers",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
     ]
    );
  }
}
