import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart'as https;
import 'package:self_practice/Model/Product.dart';

class HomeController extends GetxController{

  var allData = <Product>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  getData()async{
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await https.get(url);
    if(response.statusCode == 200)
      {
        var body = response.body.toString();
        var json = jsonDecode(body);

        log(body.toString());
        allData.value = json.map<Product>((obj) => Product.fromJson(obj)).toList();
        update();
      }
  }
}
