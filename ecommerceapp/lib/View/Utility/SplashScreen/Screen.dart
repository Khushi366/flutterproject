import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FadeTransition(
            opacity: controller.fadeAnimation, // Apply the fade-in animation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                Image.asset(
                  'assets/img/ecommerce.png',  // Ensure the path to your logo is correct
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                // App Name
                const Text("Ecommerce App", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kBlack,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
