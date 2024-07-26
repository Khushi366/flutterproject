import 'dart:ffi';

import 'package:get/get.dart';

class RegisterController extends GetxController{
  var isAccepted = false.obs;


  void toggleAcceptance(){
    isAccepted.value = !isAccepted.value;
  }
}