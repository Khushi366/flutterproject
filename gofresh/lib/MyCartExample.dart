import 'package:flutter/material.dart';
import 'package:gofresh/DetailsExample.dart';
import 'package:gofresh/PaymentMethodExample.dart';

import 'CheckoutExample.dart';

class MyCartExample extends StatefulWidget {
  const MyCartExample({super.key});

  @override
  State<MyCartExample> createState() => _MyCartExampleState();
}

class _MyCartExampleState extends State<MyCartExample> {
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
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                        Expanded(
                            child: Center(child: Text("My Cart",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          margin:EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               children: [
                                 Image.asset("assets/img/strawberry.png",width: 100.0,height: 120,),
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Fresh Strawberry",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                 SizedBox(height: 7.0,),
                                 Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                 SizedBox(height: 7.0,),
                                 Row(
                                   textBaseline: TextBaseline.alphabetic,
                                   children: [
                                     Text("₹54",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                                     Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                         decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                             Column(
                               children: [
                                 Image.asset("assets/img/plus.png",width: 20.0,),
                                 SizedBox(height: 7.0,),
                                 Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                 SizedBox(height: 7.0,),
                                 Image.asset("assets/img/minus.png",width: 20.0,),
                               ],
                             ),
                           ],
                         ),
                        ),
                        Container(
                          margin:EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/img/Mask group.png",width: 100.0,height: 120,),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Coriander Leaves",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Text("100gm",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                  SizedBox(height: 7.0,),
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("₹75",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                                      Text("₹90",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                          decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/img/plus.png",width: 20.0,),
                                  SizedBox(height: 7.0,),
                                  Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Image.asset("assets/img/minus.png",width: 20.0,),
                                ],
                              ),
                            ],
                          ),
                        ),


                        Container(
                          margin:EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/img/banana.png",width: 100.0,height: 120,),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Banana Fruits",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Text("250gm",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                  SizedBox(height: 7.0,),
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("₹50",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                                      Text("₹60",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                          decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/img/plus.png",width: 20.0,),
                                  SizedBox(height: 7.0,),
                                  Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Image.asset("assets/img/minus.png",width: 20.0,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/img/Mask group (1).png",width: 100.0,height: 120,),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Organically Potato",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Text("500gm",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                  SizedBox(height: 7.0,),
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("₹40",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                                      Text("₹50",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                          decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/img/plus.png",width: 20.0,),
                                  SizedBox(height: 7.0,),
                                  Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Image.asset("assets/img/minus.png",width: 20.0,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/img/strawberry.png",width: 100.0,height: 120,),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Fresh Strawberry",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                  SizedBox(height: 7.0,),
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("₹54",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                                      Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                          decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/img/plus.png",width: 20.0,),
                                  SizedBox(height: 7.0,),
                                  Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                  SizedBox(height: 7.0,),
                                  Image.asset("assets/img/minus.png",width: 20.0,),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12.0,top:10.0,bottom: 10.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Total : ",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0),)
                    ],
                  ),
                  Column(
                    children: [
                    Text("₹219.00",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),)
                    ],
                  ),
                  Expanded(
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(

                          onPressed: (){

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentMethodExample()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFE7551)),
                            fixedSize: MaterialStateProperty.all(Size(150.0,45.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            ),
                          ),
                          child: Text("Place Order",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 18.0,),),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
     ]
    );
  }
}
