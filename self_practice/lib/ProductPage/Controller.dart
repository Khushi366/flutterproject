import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:get/get.dart';
import 'package:self_practice/Model/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  var pid = ''.obs; // Observable for product ID
  var product = Product().obs; // Observable for product

  @override
  void onInit() {
    super.onInit();
    pid.value = Get.arguments.toString();
    log('Received pid: ' + pid.value);
    fetchProducts();
  }
  //Use Api
  // fetchProducts() async {
  //   Uri url = Uri.parse("https://fakestoreapi.com/products/${pid.value}");
  //   var response = await https.get(url);
  //   if (response.statusCode == 200) {
  //     var body = response.body.toString();
  //     var json = jsonDecode(body);
  //
  //     log(body.toString());
  //     product.value = Product.fromJson(json);
  //   }
  // }


  // Use SharedPreference (Api Get data in sharedpreference)
  fetchProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var productData = prefs.getString('productData');

    if (productData != null) {

      log("Retrieved from SharedPreferences: $productData");

      List<dynamic> jsonList = jsonDecode(productData);
      List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();

      // Find the product with the matching ID
      product.value = allProducts.firstWhere((p) => p.id == int.parse(pid.value));
    }
  }
}
