import 'dart:io';

import 'package:ecommerce/MyHomePage/Controller.dart';
import 'package:ecommerce/navigationpage/Controller.dart';
import 'package:ecommerce/productdetailspage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomeScreen extends StatelessWidget {
 final controller = Get.put(MyHomeController());


 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8EDEDA),
                  Color(0xFFA2E6D1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              title: Text('Home'),
            ),
          ),
        ),


        body: Obx(()=>
            GridView.builder(
                itemCount: controller.productdata!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context,index){

                  return GestureDetector(
                    onTap: (){
                      // Get.to(()=>ProductDetailsScreen(),arguments: [{controller.productdata![index].id.toString()}]);
                      Get.to(
                            () => ProductDetailsScreen(),
                        arguments: controller.productdata![index].id.toString(),

                      );

                    },
                    child: Container(
                       margin: EdgeInsets.all(2.0),
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: Get.width,
                            //  margin: EdgeInsets.all(8.0),
                              //padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Image.network(controller.productdata![index].images![0].toString(),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            width: 69.0,
                            height: 30.0,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFC20000),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              controller.productdata![index].discountPercentage!.toStringAsFixed(2) + '% off',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),

                          Text(controller.productdata![index].availabilityStatus.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC20000),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text("₹",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Text(controller.productdata![index].price.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          Text(controller.productdata![index].title.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),

                          ),
                        //  SizedBox(height: 60.0,)
                        ],
                      ),
                    ),
                  );
                })

        )

    );
  }
}
