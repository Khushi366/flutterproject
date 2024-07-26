import 'dart:developer';

import 'package:ecommerce/MyHomePage/Screen.dart';
import 'package:ecommerce/cartpage/Screen.dart';
import 'package:ecommerce/helper/ApiHandler.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/navigationpage/Screen.dart';
import 'package:ecommerce/resources/UrlResources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/ApiService.dart';

class ProductDetailsController extends GetxController {
  var pid = ''.obs; // Make pid observable
  var isLoading = true.obs;
  var quantity = 0.obs;
  var cartItemCount = 0.obs;
  AllProduct? product;


 // var productdata = <AllProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    pid.value =Get.arguments.toString();
    log('Received pid:'+pid.value);
    fetchProducts();// Safely access arguments
  }

//view product
  fetchProducts() async
  {
    try {
      isLoading(true);
      var productData = await ApiServices.getProductById(pid:pid.value);
      log(productData.toString());
      product = productData;
    }catch(e)
    {
      log('Error fetching product: $e');

    }
    finally {
      isLoading(false);
    }
  }




  Future<void> addProductToCart() async {
    if (product != null) {
      try {
        isLoading(true);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? userId = prefs.getString("userId");
        log("Received userId"+userId.toString());

        if(userId == null)
          {
            log("User Id Not Foun");
            isLoading(false);
            return;
          }

        Map<String, dynamic> params = {
          "userId": userId, // Add userId to the parameters
          "products": [
            {
              "id": product!.id.toString(),
              "quantity": quantity.value,
            }
          ]
        };
        log('Params to be sent: $params');
        bool success = await ApiServices.addToCart(params);
        if (success) {
          log('Product added to cart successfully');
          cartItemCount++;
         // Get.to(NavigationScreen());
        } else {
          log('Failed to add product to cart');
        }
      }catch (e) {
        log('Error adding product to cart: $e');
      } finally {
        isLoading(false);
      }
    }
  }

}
