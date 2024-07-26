import 'package:flutter/material.dart';

import 'CheckoutExample.dart';
import 'ConfirmExample.dart';
import 'PaymentMethodExample.dart';

class ProductExample extends StatefulWidget {
  const ProductExample({super.key});

  @override
  State<ProductExample> createState() => _ProductExampleState();
}

class _ProductExampleState extends State<ProductExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                  Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFE7551),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Image.asset("assets/img/ic_like (2).png", scale: 1.5,),
                  ),
                ],
              ),
              Image.asset("assets/img/dl.beatsnoop12.png", width: 210,),
              SizedBox(height: 30.0,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Organic Ladies Finger, Orka Veg",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0),),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("₹54",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 20.0,color: Color(0xFFFE7551)),),
                              Text("(1kg)",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/img/rounded.png", scale: 1.9,),
                              SizedBox(width: 4.0,),
                              Text("1",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF151515)),),
                              SizedBox(width: 4.0,),
                              Image.asset("assets/img/rounded(1).png", scale: 1.9,),

                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color:Color(0xFFFFD336), size: 20.0),
                              Text("5.0",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),)),
                            ],
                          ),
                          Text("(982)",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0),)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text("Ladies finger is a green vegetable with a tip at the end and a lighter green head, which is inedibe and to be thrown away. It tastes mild and slightly grassy. Ladies finger aids in digestion as it contains prebiotic fiber and controls obesity and cholesterol.It has loaded with Vitamin A, B, C, and traces of Zinc & Calcium. It acts as hair conditioner, fights dandruff and moistures the scalp.",
                              style: TextStyle(fontFamily: "Semibold",fontSize: 13.0,color: Color(0xFFC0C0C0),),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Text("Select Weight",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFF010101)),),
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                //color: Color(0xFFFE7551),
                                border: Border.all(color: Color(0xFFFE7551)),
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Center(child: Text("1Kg",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551)),)),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                //color: Color(0xFFFE7551),
                                  border: Border.all(color: Color(0xFFF6F4FF)),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Center(child: Text("500Kg",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551)),)),
                            ),
                          ),
                          SizedBox(width: 20,),

                          Expanded(
                            child: Container(
                              width: 120.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                //color: Color(0xFFFE7551),
                                  border: Border.all(color: Color(0xFFF6F4FF)),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Center(child: Text("200Kg",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551)),)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFF010101)),),
                          Text("View All",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      ),
                      SizedBox(height: 15,),

                      Column(
                        children: [
                          Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                            Image.asset("assets/img/girl.png",scale: 1.4,),
                              SizedBox(width: 15.0,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Max Harlynking",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101),)),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color:Color(0xFFFFD336), size: 20.0),
                                      Text("5.0",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),)),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text("July 21, 2022",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFF858585),)),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Text("It is my go-to app to order groceries. Their prices are affordable and they delivery in a few minutes.",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFF858585),)),

                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Image.asset("assets/img/girl(1).png",scale: 1.4,),
                              SizedBox(width: 15.0,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ali Karimiboroujeni",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101),)),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color:Color(0xFFFFD336), size: 20.0),
                                      Text("5.0",style: TextStyle(fontFamily: "Semibold",fontSize: 10.0,color: Color(0xFFC0C0C0),)),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text("July 21, 2022",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFF858585),)),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Text("Ladies finger is a green vegetable with a tip at the end and a lighter green head, which is inedibe and to",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFF858585),)),

                        ],
                      ),

                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Related Products",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFF010101)),),
                          Text("View All",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      ),
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
                                        Image.asset("assets/img/banana.png",width: 125.0,),
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
              SizedBox(height: 15.0,),
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      //color: Color(0xFFFE7551),
                        border: Border.all(color: Color(0xFFFE7551)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(
                        child:
                        Image.asset("assets/img/ic_cart(1).png",scale: 1.7,)
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: ElevatedButton(

                      onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaymentMethodExample()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFFE7551)),
                        fixedSize: MaterialStateProperty.all(Size(300.0,45.0)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      child: Text("Checkout",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 18.0,),),
                    ),
                  ),
                  SizedBox(width: 15.0,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
