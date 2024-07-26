import 'dart:developer';

import 'package:dioexample/helper/ApiHandler.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  var isLoading = true.obs;
  var productList = [].obs;




  Future<void> viewProduct() async {
    var apiHandler = ApiHandler();
    var response = await apiHandler.getRequest("https://dummyjson.com/products");
    if (response.statusCode == 200) {
      productList.value = response.data['products'];
      isLoading(false);
      log(response.data.toString());
    } else {
      log('Error: ${response.statusMessage}');
    }
  }
}

