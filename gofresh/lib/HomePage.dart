import 'package:flutter/material.dart';

import 'ProductExample.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/img/Vector.png",width: 20.0, height: 20.0,),
                        SizedBox(width: 9.0,),
                        Text("Work",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),
                        SizedBox(width: 4.0,),
                        Icon(Icons.keyboard_arrow_down_outlined,size: 20.0),

                      ],
                    ),
                    Text("419, Platinium Point, O/p Cng Petrol Pump...",style: TextStyle(fontSize: 10.0,fontFamily: "Regular",color: Color(0xFFC0C0C0)),)
                  ],
                ),
                Image.asset("assets/img/Icon Notification.png", width: 45.0, height: 45.0,fit: BoxFit.cover,),
              ],
            ),
            SizedBox(height: 22.0 ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [


                    Image.asset(
                      "assets/img/banner.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    SizedBox(height: 28.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shop By Categories",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                        Text("View All",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),)
                      ],
                    ),
                    SizedBox(height: 15.0,),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductExample()));
                                  },
                                  child: Container(
                                    height: 85.0,
                                    width: 85.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE2F5FF),
                                        image: DecorationImage(
                                            image: AssetImage("assets/img/vegetables.png",),
                                            scale: 2.5
                                        ),
                                        borderRadius: BorderRadius.circular(25.0)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0 ),

                                Text("Vegetables",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFEBE6),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/dl.beatsnoop1.png",),
                                          scale: 2.5
                                      ),

                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Fruits",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            ),


                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFF4D8),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/dl.beatsnoop2.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Bakery",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 20.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9EEFF),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/atta-mainda_banner.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Atta & maida",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEDEFFF),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/Ohho-Categories_App 3.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Beverages",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE3F8E0),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/Ohho-Categories_App 1.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Snacks",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 20.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFEBE6),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/Ohho-Categories_App 2.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Baby Care",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFF4D8),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/Ohho-Categories_App 4.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("Personal Care",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFF4D8),
                                      image: DecorationImage(
                                          image: AssetImage("assets/img/Ohho-Categories_App 5.png",),
                                          scale: 2.5

                                      ),
                                      borderRadius: BorderRadius.circular(25.0)
                                  ),
                                ),
                                SizedBox(height: 5.0 ),
                                Text("House Cleaning",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 27.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fruits & Vegetables",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                        Text("View All",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),)
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      height: 300.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                ),
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(-2, -2),
                                ),
                              ],
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15.0,),
                                      Image.asset("assets/img/strawberry.png",width: 150.0,),
                                      SizedBox(height: 25.0,),
                                      Text("Freshly packed\nStrawberry Fruits",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0),),
                                      Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                                textBaseline: TextBaseline.alphabetic,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹125",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                        decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        SizedBox(width: 20.0,),
                                        Container(
                                          width: 85.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFE7551),
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/img/ic_cart.png",),
                                                scale: 1.2,
                                              ),
                                              borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(50.0)
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 10.0,),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                ),
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(-2, -2),
                                ),

                              ],
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15.0,),
                                      Image.asset("assets/img/dl.beatsnoop7.png",width: 125.0,),
                                      SizedBox(height: 40.0,),
                                      Text("Freshly packed\nBroccoli Vegetables",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0),),
                                      Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                                textBaseline: TextBaseline.alphabetic,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹125",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                        decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        SizedBox(width: 20.0,),
                                        Container(
                                          width: 85.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFE7551),
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/img/ic_cart.png",),
                                                scale: 1.2,
                                              ),
                                              borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(50.0)
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),


                          SizedBox(width: 10.0,),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                ),
                                BoxShadow(
                                  color: Color(0xFFC0C0C0).withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(-2, -2),
                                ),

                              ],
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15.0,),
                                      Image.asset("assets/img/banana.png",width: 120.0,),
                                      SizedBox(height: 13.0,),
                                      Text("Freshly packed\nBanana Fruits",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0),),
                                      Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0))),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                                textBaseline: TextBaseline.alphabetic,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹125",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Text("₹200",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),
                                                        decoration: TextDecoration.lineThrough, decorationColor: Color(0xFFC0C0C0)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        SizedBox(width: 20.0,),
                                        Container(
                                          width: 85.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFE7551),
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/img/ic_cart.png",),
                                                scale: 1.2,
                                              ),
                                              borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(50.0)
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]
    );
  }
}
