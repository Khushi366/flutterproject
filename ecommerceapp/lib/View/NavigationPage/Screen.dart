import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/View/CartPage/Screen.dart';
import 'package:ecommerceapp/View/Utility/HomePage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

class NavigationScreen extends StatelessWidget {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kButtonColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add,color: kWhite,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: kWhite,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.apps_outage_sharp, color: kGeryColor),
              onPressed: () {
                controller.changeIndex(0); // Navigate to Home
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: kGeryColor),
              onPressed: () {
                controller.changeIndex(1); // Navigate to Categories
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: kGeryColor),
              onPressed: () {
                controller.changeIndex(2); // Navigate to Cart
                Get.to(()=>CartScreen());
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: kGeryColor),
              onPressed: () {
                controller.changeIndex(3); // Navigate to Profile
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(() {
      // Display the appropriate screen based on the current index
      switch (controller.index.value) {
        case 0:
          return HomeScreen(); // Your home screen widget
        case 1:
         // return CategoryScreen(); // Your category screen widget
        case 2:
         // return CartScreen(); // Your cart screen widget
        case 3:
        //  return ProfileScreen(); // Your profile screen widget
        default:
          return HomeScreen(); // Fallback to HomeScreen
      }
    });
  }
}
