import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/View/NavigationPage/Screen.dart';
import 'package:ecommerceapp/View/Utility/HomePage/Screen.dart';
import 'package:ecommerceapp/Widget/MyTextBox.dart';
import 'package:ecommerceapp/Widget/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

// Function to determine if the device is a tablet based on screen size
bool isTablet(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide > 600; // 600dp is typically considered a breakpoint for tablets
}

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // Check if the current device is a tablet
    bool tablet = isTablet(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center( // Centering content for tablet view
            child: Column(
              mainAxisAlignment: tablet ? MainAxisAlignment.center : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: tablet ? 250.0 : 30.0), // Adjust the top padding dynamically
                Image.asset(
                  'assets/img/ecommerce.png',  // Ensure the path to your logo is correct
                  width: 150,
                  height: 150,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 30.0),
                CustomTextField(
                  controller: controller.emailController.value,
                  keyboardType: TextInputType.text,
                  hintText: "Email",
                  focusedBorderColor: kButtonColor,
                  isTablet: tablet, // Pass the tablet flag to the text field
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  controller: controller.passwordController.value,
                  keyboardType: TextInputType.text,
                  hintText: "Password",
                  focusedBorderColor: kButtonColor,
                  isTablet: tablet, // Pass the tablet flag to the text field
                ),
                SizedBox(height: 15.0),
                CustomButton(
                  onPressed: () async {
                    // First, validate the form
                    if (controller.validateForm()) {
                      // Create a map with the login parameters
                      Map<String, dynamic> loginParams = {
                        'username': controller.emailController.value.text,
                        'password': controller.passwordController.value.text,
                      };
        
                      // Call the login method and wait for the result
                      bool success = await controller.login(loginParams);
        
                      // If login is successful, navigate to the home page
                      if (success) {
                        Get.off(()=>NavigationScreen());
                      }
                    }
                  },
                  buttonText: "Login",textSize: 16
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
