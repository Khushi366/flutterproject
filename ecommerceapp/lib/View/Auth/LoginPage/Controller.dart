import 'dart:convert';
import 'dart:developer';
import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/View/Utility/HomePage/Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    emailController.value.text = 'mor_2314';  // Username instead of email
    passwordController.value.text = '83r5^_';
    super.onInit();
  }

  // Email validation function
  bool isValidUsername(String email) {
    return email.isNotEmpty;
  }

  // Password validation function
  bool isValidPassword(String password) {
    return password.isNotEmpty && password.length >= 6;
  }

  // Method to validate email and password
  bool validateForm() {
    var email = emailController.value.text;
    var password = passwordController.value.text;

    if (email.isEmpty && password.isEmpty) {
      Get.snackbar(
        'Required',
        'Email and password cannot be empty.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar(
        'Required',
        'Email cannot be empty.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'Required',
        'Password cannot be empty.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (!isValidUsername(email)) {
      Get.snackbar(
        'Invalid Input',
        'Please enter a valid email.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (!isValidPassword(password)) {
      Get.snackbar(
        'Invalid Input',
        'Password must be at least 6 characters long.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }


  Future<bool> login(Map<String, dynamic> params) async {
    isLoading.value = true;

    try {
      var url = Uri.parse('https://fakestoreapi.com/auth/login');

      // Make the POST request
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}'); // Log the entire response

      if (response.statusCode == 200) {
        // Parse the JSON response
        var responseData = jsonDecode(response.body);
        log('Parsed response: $responseData'); // Log the parsed response

        // Attempt to get the token
        String? token = responseData['token'];

        // Save token in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (token != null) {
          await prefs.setString("token", token);
          print('Token saved: $token');
        } else {
          print('No Token received.');
        }

        // Decode the token to extract user info
        Map<String, dynamic> payload = _parseJwt(token);
        var userId = payload['sub']; // Assuming 'sub' contains the user ID

        // Save userId as a string if it exists
        if (userId != null) {
          // Convert userId to string if it is an int
          String userIdString = userId.toString(); // Convert to string
          await prefs.setString("userId", userIdString);
          print('User ID saved: $userIdString');
        } else {
          print('User ID not found in token.');
        }

        log('Login success: $responseData');
        Get.snackbar(
          'Login Successful',
          'Welcome!',
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
        return true;
      } else {
        // Handle non-200 responses
        log('Login failed with status: ${response.statusCode}');
        Get.snackbar(
          'Login Failed',
          'Invalid credentials. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
        return false;
      }
    } catch (error) {
      log('Login error: $error');
      Get.snackbar(
        'Error',
        'Failed to login. Please check your internet connection or try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      return false;
    }
  }

// Function to decode JWT token
  Map<String, dynamic> _parseJwt(String? token) {
    if (token == null) return {};
    final parts = token.split('.');
    if (parts.length != 3) return {};
    final payload = base64Url.normalize(parts[1]); // Get the payload part
    final decoded = utf8.decode(base64Url.decode(payload));
    return json.decode(decoded);
  }

}
