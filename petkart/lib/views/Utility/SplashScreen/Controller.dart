import 'package:get/get.dart';
import 'package:petkart/views/Intro/IntroPageView.dart';

class SplashController extends GetxController {

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 3), (){
      Get.to(() => IntroPageView());

    });
  }
}