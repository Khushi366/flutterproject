import 'dart:convert';
import 'dart:developer';
import 'package:ecommerceapp/Model/Product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var products = <Product>[].obs;
  var categories = <String>[].obs;
  int currentIndex = 0; // Regular integer

  // Function to change the index
  void changeIndex(int index) {
    currentIndex = index;
    update(); // This will notify the UI to update
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  fetchProducts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = response.body;
        var json = jsonDecode(body) as List;
        // Parse JSON list into product list
        products.value = json.map((product) => Product.fromJson(product)).toList();
        log('Products fetched successfully');
      } else {
        log('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error message
      log('An error occurred while fetching products: $e');
    }
  }

  fetchCategories() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = response.body;
        var json = jsonDecode(body) as List;
        // Parse JSON list into categories list
        categories.value = json.map((category) => category.toString()).toList();
        log('Categories fetched successfully');
      } else {
        log('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error message
      log('An error occurred while fetching categories: $e');
    }
  }
}

