import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:get/get.dart';
import 'package:self_practice/Model/Product.dart';

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

  fetchProducts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products/${pid.value}");
    var response = await https.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);

      log(body.toString());
      product.value = Product.fromJson(json);
    }
  }
}
