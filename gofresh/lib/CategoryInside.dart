import 'package:flutter/material.dart';

import 'ProductExample.dart';

class CategoryInside extends StatefulWidget {
  const CategoryInside({super.key});

  @override
  State<CategoryInside> createState() => _CategoryInsideState();
}

class _CategoryInsideState extends State<CategoryInside> {

  var item = "KG";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
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
            SizedBox(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined,size: 20.0),
                          Text("Vegetables",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),
                          Container(
                            width: 35,
                            height: 35,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFFE7551),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Image.asset("assets/img/Search 1.png", scale: 1.9,),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(25.0),
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
                                        ],
                                      ),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(height: 15.0,),
                                                Image.asset("assets/img/dl.beatsnoop11.png",width: 115.0,),
                                                SizedBox(height: 25.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10.0),
                                                      child: Text("Farm Fresh Tomato\n Hybrid",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 8.0),
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        padding: EdgeInsets.all(8.0),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFFEBE4),
                                                            borderRadius: BorderRadius.circular(10.0)
                                                        ),
                                                        child: Image.asset("assets/img/Tiiitle Text.png", scale: 1.5,),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding: const EdgeInsets.only(left: 10.0),
                                                        child: DropdownButton(
                                                          value: item,
                                                          icon: Icon(Icons.keyboard_arrow_down,color: Color(0xFFC0C0C0),),

                                                          items: [

                                                            DropdownMenuItem(child: Text("1Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),value: "KG",),
                                                            DropdownMenuItem(child: Text("2Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),value: "MG",),
                                                            DropdownMenuItem(child: Text("3Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),value: "JG",)

                                                          ],
                                                          onChanged: (val){
                                                            setState(() {
                                                              item = val!;
                                                            });
                                                          },
                                                        )
                                                      //: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0))),
                                                    ),
                                                    SizedBox(width: 2.0,),
                                                    //  Image.asset("assets/img/ic_back_arrow.png",width: 12.0,),
                                                    Container(
                                                      width: 53.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFE7551),
                                                          shape: BoxShape.rectangle,
                                                          borderRadius: BorderRadius.horizontal(
                                                              left: Radius.circular(50.0)
                                                          ),

                                                      ),
                                                      child: Center(child: Text("1",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0,color: Color(0xFFFFFFFF)),)),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 5.0,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  padding: EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFFEBE4),
                                                      borderRadius: BorderRadius.circular(10.0)
                                                  ),
                                                  child: Image.asset("assets/img/TiiitleText.png", scale: 1.5,),
                                                ),
                                                SizedBox(width: 10.0,),
                                              ],
                                            ),
                                            SizedBox(height: 10.0,),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.0,),
                                  Expanded(
                                    child:Container(
                                      // margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
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

                                        ],
                                      ),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            // /   SizedBox(height: 15.0,),
                                            Column(
                                              children: [
                                                Image.asset("assets/img/Mask group.png",width: 120.0,),
                                              ],
                                            ),
                                            SizedBox(height: 10.0,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("Fresh Organic\nCoriander Leaves",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10.0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                                        textBaseline: TextBaseline.alphabetic,
                                                        children: [
                                                          Text("₹125",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0),),
                                                          Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                              decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 55.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFE7551),
                                                          shape: BoxShape.rectangle,
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/img/ic_cart.png",),
                                                            scale: 1.5,
                                                          ),
                                                          borderRadius: BorderRadius.horizontal(
                                                              left: Radius.circular(50.0)
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.0,)
                                          ],
                                        ),
                                      ),
                                    ),


                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  Expanded(
                                    child:Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
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
                                        ],
                                      ),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15.0,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/img/dl.beatsnoop12.png",width: 140.0,),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 40.0,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("Organic Ladies Finger,\n Orka Veg",style: TextStyle(fontFamily: "Semibold",fontSize: 13.0),),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10.0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                                        textBaseline: TextBaseline.alphabetic,
                                                        children: [
                                                          Text("₹54",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                                          Text("₹60",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                              decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 55.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFE7551),
                                                          shape: BoxShape.rectangle,
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/img/ic_cart.png",),
                                                            scale: 1.5,
                                                          ),
                                                          borderRadius: BorderRadius.horizontal(
                                                              left: Radius.circular(50.0)
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.0,)
                                          ],
                                        ),
                                      ),
                                    ),


                                  ),
                                  SizedBox(width: 20.0,),

                                  Expanded(
                                    child:Container(
                                      // margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
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
                                        ],
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 15.0,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/img/dl.beatsnoop13.png",width: 143.0,),
                                                ],
                                              ),
                                              SizedBox(height: 12.0,),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10.0),
                                                    child: Text("Exotic Fresh Lemon\n (Loose)",style: TextStyle(fontFamily: "Semibold",fontSize: 13.0),),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10.0),
                                                    child: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                                          textBaseline: TextBaseline.alphabetic,
                                                          children: [
                                                            Text("₹125",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                                            Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                                decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 55.0,
                                                        height: 40.0,
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFE7551),
                                                            shape: BoxShape.rectangle,
                                                            image: DecorationImage(
                                                              image: AssetImage("assets/img/ic_cart.png",),
                                                              scale: 1.5,
                                                            ),
                                                            borderRadius: BorderRadius.horizontal(
                                                                left: Radius.circular(50.0)
                                                            )
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20.0,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),


                                  ),

                                ],
                              ),
                              SizedBox(height: 20.0,),

                              Row(
                                children: [
                                  Expanded(
                                    child:Container(
                                      // margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
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
                                        ],
                                      ),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15.0,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/img/dl.beatsnoop14.png",width: 128.0,),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20.0,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("Fresho Potato -\n Organically Grown",style: TextStyle(fontFamily: "Semibold",fontSize: 13.0),),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10.0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                                        textBaseline: TextBaseline.alphabetic,
                                                        children: [
                                                          Text("₹40",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                                          Text("₹60",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                              decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 55.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFE7551),
                                                          shape: BoxShape.rectangle,
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/img/ic_cart.png",),
                                                            scale: 1.5,
                                                          ),
                                                          borderRadius: BorderRadius.horizontal(
                                                              left: Radius.circular(50.0)
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.0,)
                                          ],
                                        ),
                                      ),
                                    ),


                                  ),
                                  SizedBox(width: 20.0,),

                                  Expanded(
                                    child:Container(
                                      // margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
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
                                        ],
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 15.0,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/img/dl.beatsnoop15.png",width: 143.0,),
                                                ],
                                              ),
                                              SizedBox(height: 28.0,),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10.0),
                                                    child: Text("Organic Cucumber -\n Naturally Grown ",style: TextStyle(fontFamily: "Semibold",fontSize: 13.0),),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10.0),
                                                    child: Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                                          textBaseline: TextBaseline.alphabetic,
                                                          children: [
                                                            Text("₹33",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                                            Text("₹40",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                                decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 55.0,
                                                        height: 40.0,
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFE7551),
                                                            shape: BoxShape.rectangle,
                                                            image: DecorationImage(
                                                              image: AssetImage("assets/img/ic_cart.png",),
                                                              scale: 1.5,
                                                            ),
                                                            borderRadius: BorderRadius.horizontal(
                                                                left: Radius.circular(50.0)
                                                            )
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20.0,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      ),
                    ),
                      Container(
                        width: double.infinity,

                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEBE4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/img/ic_sort.png",width: 25.0,),
                                SizedBox(width: 15.0,),
                                Text("Sort",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFE7551)),),
                              ],
                            ),

                            Container(
                              width: 2.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFB77158),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/img/Filter3.png",width: 18.0,),
                                SizedBox(width: 15.0,),
                                Text("Filter",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFE7551)),),
                              ],
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ),
            )
          ]
      ),
    );
  }
}
