import 'dart:convert';
import 'dart:developer';
import 'package:ecommerceapp/Model/Product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductDetailsController extends GetxController {
  var pid = ''.obs;
  var product = Product().obs; // Your Product model instance
  var currentIndex = 0.obs; // For tracking the current index
  var selectedColorIndex = 0.obs; // For tracking the selected color index
  final selectedButtonIndex = 1.obs;
  var quantity = 1.obs; // Quantity management

  // Method to change selected button index
  void changeSelectedButtonIndex(int index) {
    selectedButtonIndex.value = index;
  }

  // Method to change the index of the selected color
  void changeColorIndex(int index) {
    selectedColorIndex.value = index; // Update the selected color index
  }

  void changeIndex(int index) {
    currentIndex.value = index; // Update the current index
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

  @override
  void onInit() {
    super.onInit();
    pid.value = Get.arguments.toString(); // Safely access arguments
    log('Received pid: ' + pid.value);
    fetchProduct(); // Fetch a specific product by pid
  }

  fetchProduct() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products/${pid.value}");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        // Check if the response is not empty
        if (json != null) {
          product.value = Product.fromJson(
              json); // Assuming Product model has a fromJson method
          log('Product fetched successfully for pid: ${pid.value}');
        } else {
          log('Product data is empty for pid: ${pid.value}');
        }
      } else {
        log('Failed to load product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any error that occurs and log it
      log('An error occurred while fetching the product: $e');
    }
  }

  //Add to Cart
  Future<bool> addToCart(Map<String, dynamic> params) async {
    var url = Uri.parse('https://fakestoreapi.com/carts');
    log('Params to add to cart: ${jsonEncode(params)}');
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params),
      );
      if (response.statusCode == 200) {
        print('Add to cart successful: ${response.body}');
        // Show success snackbar using GetX
        Get.snackbar(
          'Success',
          'Item added to cart successfully!',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
        return true; // Indicate success
      } else {
        print('Failed to add to cart with status: ${response.statusCode}');
        // Show failure snackbar using GetX
        Get.snackbar(
          'Error',
          'Failed to add item to cart.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
        return false; // Indicate failure
      }
    } catch (error) {
      print('Error adding to cart: $error');
      // Show error snackbar using GetX
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      return false; // Indicate error
    }
  }
}