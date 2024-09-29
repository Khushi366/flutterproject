import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void onInit() {
    super.onInit();
    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // Define the fade-in animation
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    // Start the animation
    animationController.forward();
    // Navigate to the login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/login'); // Navigate using named route
    });
  }

  @override
  void onClose() {
    animationController.dispose(); // Dispose animation controller
    super.onClose();
  }
}
