import 'dart:developer';
import 'package:ecommerce/AllUserPage/Screen.dart';
import 'package:ecommerce/MyHomePage/Screen.dart';
import 'package:ecommerce/cartpage/Screen.dart';
import 'package:ecommerce/navigationpage/Controller.dart';
import 'package:ecommerce/navigationpage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:vibration/vibration.dart';
import 'Controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final controller = Get.put(ProductDetailsController());
  final  navController = Get.put(NavigationController());


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
            elevation: 0,
           // automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Products'),
          ),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Center(
          child: controller.isLoading.value
              ? CircularProgressIndicator(color: Color(0xFF8EDEDA),)
              : controller.product != null
              ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildProductHeader(),
                Text(controller.product!.description.toString()),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.0),
                    Text(
                      controller.product!.category.toString(),
                      style: TextStyle(color: Color(0xFF508C9B),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.0),
                    Text(
                      controller.product!.shippingInformation.toString(),
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                _buildProductImage(),
                Row(
                  children: [
                    Text("Total: ₹", style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(
                      controller.product!.price.toString(),
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text("FREE delivery", style: TextStyle(
                        color: Color(0xFF508C9B),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                    Text(
                      controller.product!.reviews![0].date.toString(),
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Text("Delivering to Surat 394105 - Update location",
                        style: TextStyle(color: Color(0xFF508C9B),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Text(
                      controller.product!.availabilityStatus.toString(),
                      style: TextStyle(color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildQuantitySelector(),
                SizedBox(height: 20.0),
                _buildAddToCartButton(),

              ],
            ),
          )
              : Text('Product not found.'),
        ),
      )),
      bottomNavigationBar: _buildBottomNavigationBar(),

    );
  }

  Widget _buildProductHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          controller.product!.title.toString(),
          style: TextStyle(color: Color(0xFF508C9B), fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Row(
          children: [
            Text(controller.product!.reviews![0].rating.toString()),
            Image.asset("assets/img/star.png", width: 70),
          ],
        )
      ],
    );
  }
  Widget _buildProductImage() {
    return Stack(
      children: [
        Positioned(
          bottom: 180,
          child: Container(
            width: 42.0,
            height: 50.0,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color(0xFFC20000),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${controller.product!.discountPercentage!.toStringAsFixed(0)}% off',
                style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        FadeInImage.assetNetwork(
          placeholder: '', // Use a valid placeholder
          image: controller.product!.thumbnail.toString(),
          width: 280,
          placeholderErrorBuilder: (context, error, stackTrace) {
            return CircularProgressIndicator(color: Color(0xFF8EDEDA),);
          },
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Obx(() {
      return Row(
        children: [
          InputQty(
            initVal: controller.quantity.value,
            minVal: 0,
            maxVal: 100,
            steps: 1,
            decoration: QtyDecorationProps(
              fillColor: Colors.grey[200],
              btnColor: Colors.black,
            ),
            onQtyChanged: (val) {
              if (val != null) {
                log('New quantity value from InputQty: $val');
                controller.quantity.value = val.toInt(); // Convert double to int
              }
            },
          ),
        ],
      );
    });
  }

  Widget _buildAddToCartButton() {
    return GestureDetector(
      onTap: () async {

        final hasVibrator = await Vibration.hasVibrator();
        if (hasVibrator != null && hasVibrator) {
          Vibration.vibrate(duration: 50);
        }
        await controller.addProductToCart();


      },
      child: Container(
        width: Get.width,
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text("Add to Cart", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // Widget _buildNavbar() {
  //   return Container(
  //     height: 60,
  //     child: NavigationScreen(
  //
  //     ),
  //   );
  // }
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, "Home", 0),
            _buildNavItem(Icons.category_outlined, "Category", 1),
            _buildNavItem(Icons.shopping_cart_outlined, "Cart", 2),
            _buildNavItem(Icons.person_outline, "User", 3),
          ],
        );
      }),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = index == navController.index.value;

    return GestureDetector(
        onTap: () {
          navController.index(index);
          if (index == 0) {
            Get.to(() => NavigationScreen());
          } else if (index == 1) {
            Get.to(() => AllUserScreen());
          } else if (index == 2) {
           Get.to(() => CartScreen());
          } else if (index == 3) {
            Get.to(() => NavigationScreen());
          }
        },
        child:Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Color(0xFF8EDEDA) : Colors.black,
                ),
                SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Color(0xFF8EDEDA) : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            if(icon == Icons.shopping_cart_outlined)
              Obx(()=>Positioned(
                right: 0,
                child: controller.cartItemCount.value>0
                    ? Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${controller.cartItemCount.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    )
                    : SizedBox.shrink(),
                )
              )
          ],
        )
    );
  }
}
