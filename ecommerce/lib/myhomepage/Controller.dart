import 'dart:developer';

import 'package:ecommerce/Service/ApiService.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeController extends GetxController{

  var isLoading = true.obs;
  var productdata = <AllProduct>[].obs;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  //view product
  fetchProducts() async
  {
    try
    {
      isLoading(true);
      var products = await ApiServices.getAllProducts();
      log(products.toString());
      productdata.assignAll(products);
    }
    finally
    {
      isLoading(false);
    }
  }

}



