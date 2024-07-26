import 'package:flutter/material.dart';

import 'CheckoutExample.dart';
import 'DetailsExample.dart';

class PaymentMethodExample extends StatefulWidget {
  const PaymentMethodExample({super.key});

  @override
  State<PaymentMethodExample> createState() => _PaymentMethodExampleState();
}

class _PaymentMethodExampleState extends State<PaymentMethodExample> {
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
                  Expanded(child: Center(child: Text("Payment",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 18.0),)))
                ],
              ),
              SizedBox(height: 34.0,),
              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBE4),
                  border: Border.all(color: Color(0xFFFE7551),width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image.asset("assets/img/ic_credit.png",width: 30.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Credit / Debit Card",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)),),
                          Text("1563 7896 9563 ****",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFFE7551),width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image.asset("assets/img/ic-net-banking.png",width: 30.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Net Banking",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)),),
                          Text("3256 4596 9632****",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),

              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFFE7551),width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image.asset("assets/img/ic-paypal.png",width: 30.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paytm / Mobikwik",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)),),
                          Text("7896 2345 9562 ****",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),

              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFFE7551),width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image.asset("assets/img/ic-g-wallet.png",width: 30.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Google Pay / BHIM UPI",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)),),
                          Text("2563 3214 1259 ****",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),

              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFFE7551),width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image.asset("assets/img/ic-delivery.png",width: 30.0,),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Case On Delivery",style: TextStyle(fontFamily: "Semibold",fontSize: 14.0,color: Color(0xFF010101)),),
                          Text("1563 7896 9563 ****",style: TextStyle(fontFamily: "Regular",fontSize: 12.0,color: Color(0xFFC0C0C0)),),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.0,),
              ElevatedButton(

                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsExample()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFE7551)),
                  fixedSize: MaterialStateProperty.all(Size(133.0,39.0)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ),
                ),
                child: Text("Save",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 18.0,),),
              ),


            ],

          ),
        ),
      ),
    ]
    );
  }
}
