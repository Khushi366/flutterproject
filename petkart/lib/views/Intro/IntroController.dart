import 'package:get/get.dart';

class IntroController extends GetxController {
  var currentPageIndex = 0.obs;

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }
}
