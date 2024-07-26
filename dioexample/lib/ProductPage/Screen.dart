import 'package:dioexample/ProductPage/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.viewProduct();
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.productList.isEmpty
            ? const Center(child: Text("Data not found!"))
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            var product = controller.productList[index];
            return GestureDetector(
              onTap: () {
                // Navigate to product details
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        product['thumbnail'],
                        width: 100.0,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Rs. ${product['price']}"),
                        const SizedBox(width: 12.0),
                        Text("Rate: ${product['rating']}"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
