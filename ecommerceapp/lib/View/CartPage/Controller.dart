import 'dart:developer';
import 'package:ecommerceapp/Model/Cart.dart';
import 'package:ecommerceapp/Model/Product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var pid = ''.obs;
  var product = Product().obs; // Your Product model instance
  var cart = Cart().obs; // Observable cart data
  var quantity = 1.obs; // Quantity management

  @override
  void onInit() {
    super.onInit();
    fetchCartData();
  }

  Future<void> fetchCartData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("userId");
      if (userId == null) {
        Get.snackbar(
          'Error',
          'User ID not found. Please log in again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return; // Exit if userId is null
      }
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/carts/user/$userId'));
      if (response.statusCode == 200) {
        // Parse the cart data
        cart.value = Cart.fromJson(
            jsonDecode(response.body)[0]); // Assuming the response is an array
      } else {
        Get.snackbar(
          'Error',
          'Failed to load cart data.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while fetching cart data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void incrementQuantity() {
    quantity.value++; // Increment the quantity
    log('Quantity increased: ${quantity.value}');
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--; // Decrement the quantity if above 1
      log('Quantity decreased: ${quantity.value}');
    }
  }
}