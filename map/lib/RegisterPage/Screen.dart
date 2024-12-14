import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map/Auth/AuthRepository.dart';
import 'package:map/LoginPage/Screen.dart';
import 'package:map/Theme/AppColor.dart';
import 'package:map/Widget/Button.dart';
import 'package:map/Widget/ContainerBox.dart';
import 'package:map/Widget/CustomeTextField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  Future<void> _validation()async{

    var user = usernameController.text.trim();
    var email = emailController.text.trim();
    var pass = passwordController.text.trim();
    var conpass = confirmPasswordController.text.trim();

    if(user.isEmpty){
      Get.snackbar(
        "Error",
        "Please add username",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }
    else if(email.isEmpty){
      Get.snackbar(
        "Error",
        "Email address cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    } else if(!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)){
      Get.snackbar(
        "Error",
        "Please enter valid email address",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }else if(pass.isEmpty){
      Get.snackbar(
        "Error",
        "Password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }else if (pass.length < 8){
      Get.snackbar(
        "Error",
        "Password must be at least 8 characters",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }else if (conpass.isEmpty){
      Get.snackbar(
        "Error",
        "Confirm Password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }else if (pass!=conpass){
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      return;
    }
    Get.snackbar(
      "Error",
      "Form submitted successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kTransparent,
      colorText: kBlack,
    );
    AuthController.instance.register(user, email, pass, conpass);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Row(
                children: [
                  MyContainer(
                      height: 50.0,
                      width: 50.0,
                      color: kWhite,
                      icon:  Icons.arrow_back_ios_new_outlined,
                      onTap: () {
                        Get.to(()=>LoginScreen());
                      }
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Text("Hellow! Register to get started",style: TextStyle(fontSize:28.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 30.0,),

              customeTextBox(
                  controller:usernameController,
                  hintText: "Username"
              ),
              customeTextBox(
                  controller: emailController,
                  hintText: "Email"
              ),
              customeTextBox(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              customeTextBox(
                  controller: confirmPasswordController,
                  hintText: "ConfirmPassword",
                  obscureText: true,
              ),
              SizedBox(height: 20.0,),
              PrimaryButton(
                height: 55.0,
                title: 'Register',
                color: kRed,
                onTap: _validation,
              ),
              SizedBox(height: 25.0,),
              Text("Or Register with"),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyContainer(
                      height: 65,
                      width: 130,
                      color: kWhite,
                      icon:  Icons.document_scanner_outlined
                  ),
                  SizedBox(width: 10.0,),
                  MyContainer(
                      height: 65,
                      width: 130,
                      color: kWhite,
                      icon:  Icons.ac_unit_outlined
                  ),
                ],
              ),
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold),),
                  InkWell(
                      onTap: (){
                        Get.to(()=>LoginScreen());
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text("?Login Now",style: TextStyle(fontSize:14.0,fontWeight: FontWeight.bold,color: kRed),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
