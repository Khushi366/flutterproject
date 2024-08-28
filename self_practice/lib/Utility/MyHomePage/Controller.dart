import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart'as https;
import 'package:self_practice/Model/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{

  var allData = <Product>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
   //Use Api
  // getData()async{
  //   Uri url = Uri.parse("https://fakestoreapi.com/products");
  //   var response = await https.get(url);
  //   if(response.statusCode == 200)
  //     {
  //       var body = response.body.toString();
  //       var json = jsonDecode(body);
  //
  //       log(body.toString());
  //       allData.value = json.map<Product>((obj) => Product.fromJson(obj)).toList();
  //       update();
  //     }
  // }


  // Use SharedPreference (Api Strore data in sharedpreference)
  getData() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await https.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);

      log(body.toString());
      allData.value = json.map<Product>((obj) => Product.fromJson(obj)).toList();
      // Convert data to JSON and log it before storing
      var productData = jsonEncode(allData.map((e) => e.toJson()).toList());
      log("Storing in SharedPreferences: $productData");

      // Store data in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('productData', jsonEncode(allData.map((e) => e.toJson()).toList()));

      update();
    }
  }


}
