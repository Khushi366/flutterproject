import 'dart:convert';
import 'dart:developer';
import 'package:self_practice/Helper/ApiHandler.dart';
import 'package:self_practice/resources/UrlResources.dart';
import 'package:get/get.dart';
class ApiServices
{
  //insert Product
  static Future<bool> insertProduct(params) async
  {
    var jsonParams = json.encode(params);
    var jsonResponse = await ApiHandler.postRequest(UrlResources.LOGIN, headers: {'Content-Type': 'application/json'},body: jsonParams);
    if (jsonResponse != null) {
      var status = jsonResponse["status"];
      var message = jsonResponse["message"];

      // Ensure status and message are not null
      if (status != null && message != null) {
        if (status == "true") {
          Get.snackbar("Success", message);
          return true;
        } else {
          Get.snackbar("Error", message);
          return false;
        }
      } else {
        Get.snackbar("Error", "Unexpected response format",snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    } else {
      Get.snackbar("Error", "No response from server",snackPosition: SnackPosition.BOTTOM);
      return false;
    }
   }
  }