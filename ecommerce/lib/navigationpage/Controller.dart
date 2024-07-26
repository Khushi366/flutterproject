import 'package:get/get.dart';

class NavigationController extends GetxController{
  var index = 0.obs;


  void changeIndex(int newIndex) {
    index.value = newIndex;
  }
  // void goToProductDetails() {
  //   index.value = 1; // Assuming index 1 for ProductDetailsScreen
  // }
}