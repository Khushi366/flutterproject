import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Utility/MyHomePage/Screen.dart';
import 'package:self_practice/services/ApiServices.dart';

class LoginController extends GetxController{

  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var isLoading = false.obs;
  var isObscure = true.obs;

  @override
  void onInit() {
    usernameController.value.text = 'emilys';
    passwordController.value.text = 'emilyspass';
    super.onInit();
  }


  Login() async
  {
    try
    {
      isLoading(true);
      var params = {
        "username":usernameController.value.text.toString(),
        "password":passwordController.value.text.toString(),
      };
      var result = await ApiServices.insertProduct(params);
      if(result==true)
      {
        usernameController.value.text="";
        passwordController.value.text="";
        Get.to(HomeScreen());
      }
    }
    finally
    {
      isLoading(false);
    }
  }


}
