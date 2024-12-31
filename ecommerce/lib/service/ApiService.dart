import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/helper/ApiHandler.dart';
import 'package:ecommerce/helper/ErrorHandler.dart';
import 'package:ecommerce/model/AllCarts.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/resources/UrlResources.dart';
import 'package:get/get.dart';

class ApiServices
{

  // static Future<AllProduct> addToCart(String productId, int quantity) async {
  //   log('Product ID: $productId', name: 'ApiServices');
  //   log('Quantity: $quantity', name: 'ApiServices');
  //
  //   Map<String, dynamic> params = {
  //     "product_id": productId,
  //     "quantity": quantity,
  //
  //   };
  //   dynamic jsonResponse = await ApiHandler.postRequest(
  //     UrlResources.ADD_TO_CART,
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(params),
  //   );
  //
  //   if (jsonResponse["status"] == "true") {
  //     var message = jsonResponse["message"];
  //     log(message);
  //     Get.snackbar("Success", message);
  //     return AllProduct.fromJson(jsonResponse); // Ensure AllProduct.fromJson exists
  //   } else {
  //     var message = jsonResponse["message"];
  //     log(message);
  //     Get.snackbar("Error", message);
  //     throw Exception(message);
  //   }
  // }


  // static Future<bool> Login(Map<String, dynamic> params) async {
  //   try {
  //     dynamic jsonResponse = await ApiHandler.postRequest(
  //       UrlResources.LOGIN,
  //       body: json.encode(params),
  //     );
  //     if (jsonResponse['token'] != null) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString("islogin","yes");
  //       prefs.setString("token",jsonResponse["token"].toString());
  //       var message = jsonResponse["message"] ?? "Login successful";
  //       Get.snackbar('Login Successful', message);
  //       return true;
  //
  //     } else {
  //       // Handle the case where login is not successful
  //       Get.snackbar('Login Failed', jsonResponse['message'] ?? 'Unknown error');
  //       return false;
  //     }
  //   } catch (e) {
  //     if (e is ErrorHandler) {
  //       Get.snackbar('Error', e.message);
  //     } else {
  //       Get.snackbar('Error', e.toString());
  //     }
  //     return false;
  //   }
  // }

  static Future<dynamic> login(Map<String, dynamic> params) async {
    return await ApiHandler.postRequest(
      UrlResources.LOGIN,
      body: json.encode(params),
    );
  }

  static Future<bool> addToCart(Map<String, dynamic> params) async {
    try {
      dynamic jsonResponse = await ApiHandler.postRequest(
        UrlResources.ADD_TO_CART,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(params),
      );

      // jsonResponse['id'] = 1;
      // jsonResponse['userId'] = 33;
      log('Response body: $jsonResponse');
      if (jsonResponse is Map && jsonResponse["id"] != null) {
        var message = jsonResponse["message"] ?? "Product added to cart";
        log('Add to cart success: $message');
        Get.snackbar("Success", message, snackPosition: SnackPosition.BOTTOM);
        return true;
      } else {
        var message = jsonResponse["message"] ?? "Failed to add product to cart";
        log('Add to cart failure: $message');
        Get.snackbar("Error", message, snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    } catch (e, stacktrace) {
      if (e is ErrorHandler) {
        log('Error in addToCart: ${e.toString()}', error: e, stackTrace: stacktrace);
      } else {
        log('Unexpected error in addToCart: $e', error: e, stackTrace: stacktrace);
      }
      return false;
    }
  }


  static Future<List<AllCarts>> getAllUser() async
  {
    var json = await ApiHandler.getRequest(UrlResources.ALL_USER);

    return json["carts"].map<AllCarts>((obj)=>AllCarts.fromJson(obj)).toList();
  }


  static Future<List<AllProduct>> getAllProducts() async
  {
    var json = await ApiHandler.getRequest(UrlResources.ALL_PRODUCTS);

    return json["products"].map<AllProduct>((obj)=>AllProduct.fromJson(obj)).toList();
  }


  static Future<AllProduct>getProductById({required String pid}) async {

      var json = await ApiHandler.getRequest('${UrlResources.ALL_PRODUCTS}/$pid');

      log('API Response: $json');

      return AllProduct.fromJson(json);
  }
  //add to cart
}







// class ApiServices {
//   static Future<List<Product>> getAllProducts() async {
//     try {
//       var json = await ApiHandler.getRequest(UrlResources.ALL_PRODUCTS);
//
//       // Extract "carts" array from JSON, defaulting to an empty list if absent
//       var carts = json['carts'] as List<dynamic> ?? [];
//
//       // Use flatMap to directly access and map "products" arrays
//       var products = carts.expand<Product>((cart) => (cart['products'] as List<dynamic>).map<Product>((obj) => Product.fromJson(obj))).toList();
//
//       return products;
//     } catch (e) {
//       print('Error fetching products: $e');
//       return []; // Handle error gracefully, returning empty list
//     }
//   }
// }
