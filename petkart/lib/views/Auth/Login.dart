import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/ForgotPassword.dart';
import 'package:petkart/views/Auth/Register/Screen.dart';
import 'package:petkart/views/Utility/NavigationPage/Screen.dart';
import 'package:petkart/widgets/MyTextBox.dart';
import 'package:petkart/widgets/PrimaryButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    var isTablet = DeviceLayout.isTablet(context);
    var logoSize = isTablet ? 400.0 : 140.0;

    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Container(
              width: isTablet ? 400.0 : double.infinity,
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 50.0 : Get.height * 0.1),
                  Image.asset(
                    "assets/img/logo.png",
                    width: logoSize,
                    height: logoSize,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text("Login", style: Get.textTheme.headlineSmall),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text("Email Address*", style: Get.textTheme.titleLarge),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  customTextField(
                    context: context,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text("Password*", style: Get.textTheme.titleLarge),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  customTextField(
                    context: context,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(PasswordPage());
                        },
                        child: Text(
                          "Forgot password?",
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  PrimaryButton(
                    btntext: "Login",
                    onclick: () {
                      // Implement your login logic
                      Get.to(NavigationScreen());
                    },
                    btncolor: kPrimaryColorDark,
                  ),
                  SizedBox(height: Get.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have an account?",
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Get.to(Register());
                        },
                        child: Text(
                          "Create",
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 12.0,
                            color: kPrimaryColorDark,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: kPrimaryColorDark,
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
