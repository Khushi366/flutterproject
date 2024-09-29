import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/Theme/DeviceLayout.dart';
import 'package:ecommerceapp/View/ProductDetailsPage/Controller.dart';
import 'package:ecommerceapp/Widget/MyTextBox.dart';
import 'package:ecommerceapp/Widget/OtherButton.dart';
import 'package:ecommerceapp/Widget/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'Controller.dart';

class CartScreen extends StatelessWidget {
  final controller = Get.put(CartController());
  final productController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceLayout.isTablet(context);
    return Scaffold(
      backgroundColor: kGeryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: isTablet ? 30.0 : 30.0), // Adjust the top padding dynamically
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildIconButton(
                    icon: Icons.arrow_back_ios_new_outlined,
                    backgroundColor: kWhite,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Text('My Cart', style: TextStyle(color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.cart.value.products == null || controller.cart.value.products!.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(color: kButtonColor),
                );
              }

              return ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling for ListView
                shrinkWrap: true, // Make ListView take only the needed height
                padding: EdgeInsets.all(0),
                itemCount: controller.cart.value.products!.length,
                itemBuilder: (context, index) {
                  var product = controller.cart.value.products![index];
                  return Container(
                    width: Get.width,
                    height: 120,
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: kGeryLightColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Product ID: ${product.productId}',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis, // Avoid overflow
                                    ),
                                  ),
                                  // Delete Button
                                  Flexible(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete_outline,
                                        color: kButtonColor,
                                      ),
                                      onPressed: () {}
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('\$100.00',style: TextStyle(fontWeight: FontWeight.bold),)),

                                  Expanded(
                                      flex: 1,
                                      child: Text('Qty: ${product.quantity}')),

                                  _buildQuantitySelector(controller),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
            SizedBox(height: 20.0),
            Container(
              width: Get.width,
              height: 345.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: "Enter Discount Code",
                    borderRadius: 30.0,
                    child: InkWell(
                        onTap:(){},
                        child: Text("Apply", style: TextStyle(color: kButtonColor, fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: isTablet ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SubTotal", style: TextStyle(color: kGeryColor, fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(width: 200,),
                      Text("\$100.00", style: TextStyle(color: kBlack, fontSize: 16, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Divider(color: kGeryLightColor, height: 40, thickness: 2),
                  Row(
                    mainAxisAlignment: isTablet ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(color: kBlack, fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(width: 230,),
                      Text("\$100.00", style: TextStyle(color: kBlack, fontSize: 16, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 60.0),
                  CustomButton(
                    onPressed: () async{
                      if (await Vibration.hasVibrator()?? false) {
                      Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
                      }
                      Get.snackbar(
                        "Checkout",
                        "Checkout button pressed",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    height: 35.0,
                    borderRadius: 30.0,
                    buttonText: "Checkout",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(CartController controller) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: kGeryLightColor,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: kWhite, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              controller.decrementQuantity(); // Decrease quantity
            },
            icon: Icon(Icons.remove, color: kBlack, size: 20.0),
          ),
          Obx(() {
            return Expanded(
              child: Center(
                child: Text(
                  "${controller.quantity.value}",
                  style: TextStyle(color: kBlack, fontSize: 12.0, fontWeight: FontWeight.bold),
               //   overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                controller.incrementQuantity(); // Increase quantity
              },
              icon: Icon(Icons.add, color: kBlack, size: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
