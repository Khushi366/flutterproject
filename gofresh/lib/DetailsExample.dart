import 'package:flutter/material.dart';
import 'package:gofresh/CheckoutExample.dart';

class DetailsExample extends StatefulWidget {
  const DetailsExample({super.key});

  @override
  State<DetailsExample> createState() => _DetailsExampleState();
}

class _DetailsExampleState extends State<DetailsExample> {
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 40.0,),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0)),
                      Expanded(child: Center(child: Text("Details",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),)))
                    ],
                  ),
                  SizedBox(height: 34.0,),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deliver To",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),
                              Text("Edit",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFFE7551)),),

                            ],
                          ),
                          SizedBox(height: 10.0,),

                          Row(
                            children: [
                              Container(
                                width: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFEBE4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/img/location.png",scale: 1.9,),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: [
                                      Text("4517 Washington Ave. Manchester, Kentucky 39495",style: TextStyle(fontFamily: "Semibold",fontSize: 16.0,color: Color(0xFF010101)),),
                                    ],
                                  ),
                                ),
                              ),
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
                              Text("Payment Method",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),
                              Text("Edit",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0,color: Color(0xFFFE7551)),),

                            ],
                          ),
                          SizedBox(height: 5.0,),
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

                  SizedBox(height: 113.0,),

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

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckoutExample()));
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
                            child: Text("Continue",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFE7551),fontSize: 18.0,),),
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
