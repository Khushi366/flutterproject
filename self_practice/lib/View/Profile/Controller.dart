//Without refresh token
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProfileController extends GetxController {
//
//   var isLoading = false.obs;
//   var username = ''.obs;
//   var email = ''.obs;
//
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     loadUserProfile();
//   }
//   void loadUserProfile() async {
//     isLoading(true);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     username.value = prefs.getString('username') ?? 'Unknown User';
//     email.value = prefs.getString('email') ?? 'Unknown Email';
//
//     isLoading(false);
//   }
//
// }




//with refresh token

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var username = ''.obs;
  var email = ''.obs;
  var token = ''.obs;
  var refreshToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    username.value = prefs.getString('username') ?? 'Unknown User';
    email.value = prefs.getString('email') ?? 'Unknown Email';
    token.value = prefs.getString('token') ?? '';
    refreshToken.value = prefs.getString('refreshToken') ?? '';

    // Fetch profile details using the access token
    await fetchUserProfile();

    isLoading(false);
  }

  Future<void> fetchUserProfile() async {
    try {
      // Make the API request using the access token
      final response = await http.get(
        Uri.parse('https://dummyjson.com/auth/me'),
        headers: {'Authorization': 'Bearer ${token.value}'},
      );

      if (response.statusCode == 200) {
        // Handle successful response
        var jsonResponse = json.decode(response.body);
        username.value = jsonResponse['username'];
        email.value = jsonResponse['email'];
      } else if (response.statusCode == 401) {
        // Token expired, try to refresh it
        await refreshAccessToken();
        // Retry the request after getting a new access token
        await fetchUserProfile();
      } else {
        // Handle other errors
        Get.snackbar('Error', 'Failed to fetch user profile',snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> refreshAccessToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'refreshToken': refreshToken.value}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        token.value = jsonResponse['token'];
        refreshToken.value = jsonResponse['refreshToken'];

        // Save the new tokens to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token.value);
        prefs.setString('refreshToken', refreshToken.value);

        Get.snackbar('Success', 'Token refreshed successfully',snackPosition: SnackPosition.BOTTOM);
      } else {
        // Handle refresh token failure
        Get.snackbar('Error', 'Failed to refresh token',snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',snackPosition: SnackPosition.BOTTOM);
    }
  }
}

