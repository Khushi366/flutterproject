import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/views/CartPage/Screen.dart';
import 'package:petkart/views/CategoryPage/Screen.dart';
import 'package:petkart/views/ProfilePage/Screen.dart';
import 'package:petkart/views/utility/MyHomePage/Screen.dart';
import 'Controller.dart';

class NavigationScreen extends StatelessWidget {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBody(),
          _buildCustomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Obx(() {
      switch (controller.index.value) {
        case 0:
          return MyHomePage();
        case 1:
          return CategoryScreen();
        case 2:
          return CartScreen();
        case 3:
          return ProfileScreen();
        default:
          return MyHomePage();
      }
    });
  }

  Widget _buildCustomNavigationBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 56, // Adjust height as needed
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
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, "Home", 0),
            _buildNavItem(Icons.category_outlined, "Category", 1),
            _buildNavItem(Icons.shopping_cart_outlined, "Cart", 2),
            _buildNavItem(Icons.person_outline, "User", 3),
          ],
        )),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: controller.index.value == index ? kPrimaryColorDark : kgrey,
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: controller.index.value == index ? kPrimaryColorDark : kgrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
