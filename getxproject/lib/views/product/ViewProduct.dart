import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controllers/ProductController.dart';
import 'package:getxproject/views/product/EditProduct.dart';

class ViewProduct extends GetView<ProductController> {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Products"),
      ),
      body: Obx((){
        if(controller.isLoading==true)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        else
          {
            return ListView.builder(
              itemCount: controller.productdata.length,
              itemBuilder: (context,index)
              {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.purple
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(controller.productdata![index].pname.toString(),style: TextStyle(color: Colors.white),)),
                          GestureDetector(
                              onTap: (){


                                var pid = controller.productdata![index].pid.toString();
                                controller.deleteProduct(pid);


                              },
                              child: Icon(Icons.delete,color: Colors.white,size: 20.0,)
                          ),

                          SizedBox(width: 10.0,),
                          GestureDetector(
                              onTap: () async{

                                var pid = controller.productdata![index].pid.toString();
                                await controller.getsingleproduct(pid);
                                Get.to(EditProduct());


                              },
                              child: Icon(Icons.edit,color: Colors.white,size: 20.0,)
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty"+controller.productdata![index].qty.toString(),style: TextStyle(color: Colors.white),),
                          Text("Rs."+controller.productdata![index].price.toString(),style: TextStyle(color: Colors.white),),
                          Text("date"+controller.productdata![index].addedDatetime.toString(),style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
      }),
    );
  }
}
