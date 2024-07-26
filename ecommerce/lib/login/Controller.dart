import 'dart:developer';

import 'package:ecommerce/MyHomePage/Screen.dart';
import 'package:ecommerce/Service/ApiService.dart';
import 'package:ecommerce/helper/ErrorHandler.dart';
import 'package:ecommerce/navigationpage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    usernameController.value.text = 'emilys';
    passwordController.value.text = 'emilyspass';
    super.onInit();
  }


  Future<bool> login(Map<String, dynamic> params) async {
    isLoading.value = true;
    try {
      log('Login parameters: $params');
      dynamic jsonResponse = await ApiServices.login(params);
      log('Full Response: $jsonResponse');
      if (jsonResponse['token'] != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("islogin", "yes");
        prefs.setString("token", jsonResponse["token"].toString());
        if (jsonResponse.containsKey("id")) {
          prefs.setString("userId", jsonResponse["id"].toString());  // Save id as userId
          log('User ID saved: ${jsonResponse["id"]}');
        } else {
          log('id not found in the response');
        }
        var message = jsonResponse["message"] ?? "Login successful";
        Get.snackbar('',snackPosition: SnackPosition.BOTTOM,message);
        isLoading.value = false;
        Get.to(NavigationScreen());
        return true;

      } else {
        Get.snackbar('',snackPosition: SnackPosition.BOTTOM, jsonResponse['message'] ?? 'Unknown error');
        isLoading.value = false;
        Get.back();
        return false;
      }
    } catch (e) {
      if (e is ErrorHandler) {
        Get.snackbar('Error', e.message);
      } else {
        Get.snackbar('Error', e.toString());
      }
      isLoading.value = false;
      Get.back();
      return false;
    }
  }
}
