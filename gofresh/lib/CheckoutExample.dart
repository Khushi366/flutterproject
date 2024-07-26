import 'package:flutter/material.dart';

import 'ConfirmExample.dart';

class CheckoutExample extends StatefulWidget {
  const CheckoutExample({super.key});

  @override
  State<CheckoutExample> createState() => _CheckoutExampleState();
}

class _CheckoutExampleState extends State<CheckoutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                    Expanded(child: Center(child: Text("Checkout",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),)))
                  ],
                ),

                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,top: 10.0),
                        child: Text("Products",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0),),
                      ),

                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/img/strawberry.png", width: 70.0, height: 60.0,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fresh Strawberry",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                    Text("1 Kg",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                  ],
                                ),
                              ),
                            ),
                            Text("₹54.00",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551),)),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFFE6E6E6),indent: 15.0,endIndent: 15.0,thickness: 1.0,),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/img/Mask group.png", width: 70.0, height: 60.0,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Coriander Leaves",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                    Text("100gm",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                  ],
                                ),
                              ),
                            ),
                            Text("₹75.00",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551),)),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFFE6E6E6),indent: 15.0,endIndent: 15.0,thickness: 1.0,),

                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/img/Mask group (1).png", width: 70.0, height: 60.0,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Organically Potato",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 14.0),),
                                    Text("500gm",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFC0C0C0))),
                                  ],
                                ),
                              ),
                            ),
                            Text("₹40.00",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFE7551),)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Payment",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101)),),
                            Text("Change",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFFE7551)),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Image.asset("assets/img/paypal Logo.png", width: 95.0, height: 40.0,),
                            Text("2121 6352 8465 ****",style: TextStyle(fontFamily: "Regular",fontSize: 14.0,color: Color(0xFF010101)),),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101)),),
                        Text("4517 Washington Ave. Manchester, Kentucky 39495",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFFC0C0C0)),)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Coupons",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101)),),
                        SizedBox(height: 10.0,),

                        Row(
                          children: [
                            Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEBE4),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/img/ic_coupons.png",scale: 1.5,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("1 Coupon applied",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101)),),
                                    Text("You saved additional ₹300",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFF50AD64)),),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset("assets/img/ic_back_arrow(2).png",width: 20.0,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.0,),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE7551),
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
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total :",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                            Text("₹219.00 ",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping Fees :",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                            Text("₹50.00 ",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax(2%) : ",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                            Text("₹60.00 ",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("------------------------------------------------------ ",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                          ],
                        ),

                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total : ",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                            Text("₹329 ",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 16.0,color: Color(0xFFFFFFFF)),),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        ElevatedButton(

                          onPressed: (){

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ConfirmExample()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
                            fixedSize: MaterialStateProperty.all(Size(300.0,45.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            ),
                          ),
                          child: Text("Confirm",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFE7551),fontSize: 18.0,),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
