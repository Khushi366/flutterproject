import 'dart:convert'; // Import for json.encode
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:self_practice/Utility/MyHomePage/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var isLoading = false.obs;
  var isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Pre-fill credentials for testing
    usernameController.value.text = 'emilys';
    passwordController.value.text = 'emilyspass';
  }

  Future<void> Login() async {
    var params = {
      "username": usernameController.value.text,
      "password": passwordController.value.text,
    };

    Uri url = Uri.parse("https://dummyjson.com/auth/login");

    try {
      isLoading(true);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params), // Encode the params to JSON
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        // Adjust the condition to check for the presence of a token

        if (jsonResponse['token'] != null && jsonResponse['refreshToken'] != null) {
          log('Login successful');

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("isLogin","yes");
          await prefs.setString("token", jsonResponse['token']);
          await prefs.setString("refreshToken", jsonResponse['refreshToken']);
          await prefs.setString("username", jsonResponse['username']);
          Get.snackbar( "Success",jsonResponse["message"]??"Login successful",  snackPosition: SnackPosition.BOTTOM);
          usernameController.value.clear();
          passwordController.value.clear();

          Get.to(() => HomeScreen()); // Navigate to HomeScreen
        } else {
          log('Login failed');
          Get.snackbar( "Success",jsonResponse["message"]??"Login failed",snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        log('Request failed with status: ${response.statusCode}');
        Get.snackbar("Error", "Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      log('Exception occurred: $e');
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading(false);
    }
  }

}
