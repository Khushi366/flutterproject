import 'package:get/get.dart';

class NavigationController extends GetxController{
  var index = 0.obs;

  void changeIndex(int newIndex) {
    index.value = newIndex;
  }
}