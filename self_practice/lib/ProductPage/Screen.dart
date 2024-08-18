import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Utility/MyDrawer.dart';
import 'Controller.dart'; // Import your ProductDetailsController

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate ProductDetailsController
    final controller = Get.put(ProductDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Obx(() {
        // Use ternary operator to handle loading and display states
        return controller.product.value.title == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use ternary operator to check for null values
              controller.product.value.image != null
                  ? Center(
                  child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.png', // Provide a valid placeholder
                  image: controller.product.value.image!,
                  width: 90,
                  fadeInDuration: Duration(milliseconds: 500),
                  placeholderErrorBuilder: (context, error, stackTrace) {
                    return CircularProgressIndicator(color: Color(0xFF8EDEDA));
                  },
                ),
              )
                  : SizedBox.shrink(),
              Text(
                controller.product.value.price != null
                    ? '\$${controller.product.value.price!.toStringAsFixed(2)}'
                    : '', style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 16.0),
              Text(
                controller.product.value.title ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                controller.product.value.description ?? '',
                style: TextStyle(fontSize: 18,),
              ),
            ],
          ),
        );
      }),
    );
  }
}
