import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/Register/Controller.dart';
import 'package:petkart/views/Auth/VerifyPage.dart';
import 'package:petkart/widgets/MyTextBox.dart';
import 'package:petkart/widgets/PrimaryButton.dart';
import '../Login.dart';

class Register extends StatelessWidget {
  var registerController = Get.put(RegisterController());

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
              width:  isTablet ? 400.0 : double.infinity,
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 50.0 : 40.0),
                  Image.asset(
                    "assets/img/logo.png",
                    width: logoSize,
                    height: isTablet ? 335.0 : 140.0,
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Text("Create an Account", style: Get.textTheme.headlineSmall),
                    ],
                  ),
                  SizedBox(height: 20.0,),
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
                  SizedBox(height: 20.0,),
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
                  SizedBox(height: 20.0,),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      // Handle phone number changes
                    },
                    inputDecoration: InputDecoration(
                      hintText: 'Enter phone no',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlack),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kgrey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: kBlack,
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Text("Address*", style: Get.textTheme.titleLarge),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  customTextField(
                    context: context,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Obx(() => GestureDetector(
                        onTap: () {
                          registerController.toggleAcceptance();
                        },
                        child: Icon(
                          registerController.isAccepted.value ? Icons.radio_button_off : Icons.task_alt,
                          color: registerController.isAccepted.value ? kgrey : kBlack,
                        ),
                      )),
                      Text("I accept the ", style: Get.textTheme.bodySmall!.copyWith(fontSize: 11.0, fontWeight: FontWeight.bold)),
                      Text("Terms & Conditions", style: Get.textTheme.bodySmall!.copyWith(
                        fontSize: 12.0,
                        color: kPrimaryColorDark,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: kPrimaryColorDark,
                        decorationThickness: 2.0,
                      )),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  PrimaryButton(
                    btntext: "Register",
                    onclick: () {
                      Get.to(VerifyPage());
                    },
                    btncolor: kPrimaryColorDark,
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: Get.textTheme.bodySmall!.copyWith(fontSize: 11.0, fontWeight: FontWeight.bold,)),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Get.to(Login());
                        },
                        child: Text("Login", style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: 12.0,
                          color: kPrimaryColorDark,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: kPrimaryColorDark,
                          decorationThickness: 2.0,
                        )),
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
