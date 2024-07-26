import 'dart:developer';

import 'package:ecommerce/Service/ApiService.dart';
import 'package:ecommerce/model/AllCarts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllUserController extends GetxController{

  var isLoading = true.obs;
  var allUserData = <AllCarts>[].obs;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  //view product
  void fetchProducts() async {
    try {
      isLoading(true);
      var users = await ApiServices.getAllUser();
      if (users != null) {
        allUserData.assignAll(users);
      }
    } catch (e) {
      print("Error fetching products: $e");
      // Handle error (e.g., show error message to user)
    } finally {
      isLoading(false);
    }
  }
}
