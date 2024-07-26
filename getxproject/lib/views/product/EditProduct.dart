import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controllers/ProductController.dart';
import 'package:getxproject/views/product/ViewProduct.dart';
class EditProduct extends GetView<ProductController> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            TextField(
              controller: controller.name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),

              ),
            ),

            SizedBox(height: 20.0,),

            TextField(
              controller: controller.qty,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Qty",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            SizedBox(height: 20.0,),


            TextField(
              controller: controller.price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Price",
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),

            SizedBox(height: 20.0,),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () async{

                    await controller.updateProduct();
                    Get.off(ViewProduct());


                  }, child: Text("Save")),
            )

          ],
        ),
      ),

    );
  }
}
