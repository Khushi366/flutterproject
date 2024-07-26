import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/Login.dart';
import 'package:petkart/views/Auth/Register/Screen.dart';
import 'package:petkart/widgets/MyTextBox.dart';
import 'package:petkart/widgets/PrimaryButton.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceLayout.isTablet(context);
    var logoSize = isTablet ? 400.0 : 140.0;
    // var spacing = isTablet ? 40.0 : 20.0;

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
                      Text("Reset Your Password", style: Get.textTheme.headlineSmall),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                          child: Text("Please enter your email address.You will receive a link to creat a new password via email.", style: Get.textTheme.bodySmall!.copyWith(color: kgrey,fontWeight: FontWeight.bold))),
                    ],
                  ),

                  SizedBox(height: 40.0),
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

                  SizedBox(height: 30.0),
                  PrimaryButton(
                    btntext: "Send",
                    onclick: () {
                      // Implement your login logic here

                    },
                    btncolor: kPrimaryColorDark,
                  ),

                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(Login());
                        },
                        child: Text(
                          "Cancel",
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 12.0,
                            color: kBlack,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: kBlack,
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
