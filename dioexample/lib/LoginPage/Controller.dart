import 'dart:developer';
import 'package:dioexample/helper/ApiHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;


  TextEditingController username =TextEditingController();
  TextEditingController password =TextEditingController();
  @override
  void onInit() {
    super.onInit();
    username = TextEditingController(text: 'emilys');
    password = TextEditingController(text: 'emilyspass');
  }





  Future<bool> login() async {
    isLoading(true);
    var apiHandler = ApiHandler();
    var response = await apiHandler.postRequest(
      'https://dummyjson.com/auth/login',
      data:{
        "username":username.text.toString(),
        "password":password.text.toString()
      },
    );
    if (response.statusCode == 200) {
      log(response.data.toString());
      return true;
    } else {
      if(response.statusCode==400)
      {
        print('Bad Request');

      }
      // Handle error response
      print('Error: ${response.statusMessage}');
      return false;

    }
  }
}
