import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Theme/AppColor.dart';
import 'package:self_practice/View/Login/Controller.dart';
import 'package:self_practice/Widget/MyTextBox.dart';
import 'package:self_practice/Widget/PrimaryButton.dart';

class LoginScreen extends StatelessWidget {
 final controller  = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",style: TextStyle(color: kWhite),),
        centerTitle: true,
        backgroundColor: kAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            SizedBox(height: 20.0,),

            customTextField(
              controller: controller.usernameController.value,
              hintText: "Enter Email ID"
            ),
            SizedBox(height: 20.0,),

            customTextField(

                controller: controller.passwordController.value,

                hintText: "Enter Password"
            ),
            SizedBox(height: 20.0,),

            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator() // Show loading indicator if `isLoading` is true
            :PrimaryButton(
              btntext: 'Login',
              onclick: () {
                controller.Login();


              },
              btncolor: kButtonColor,

            ))


          ],
        ),
      ),
    );
  }
}
