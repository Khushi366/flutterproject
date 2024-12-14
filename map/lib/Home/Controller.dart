import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var emailList = <String>[].obs;  // Observable list of emails
  var passwordList = <String>[].obs;  // Observable list of passwords

  // This method is called to load data from SharedPreferences
  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailList.value = prefs.getStringList("email") ?? [];
    passwordList.value = prefs.getStringList("passwords") ?? [];
    log("Email List: ${emailList.toString()}");
  }

  // This method is used to delete an item from SharedPreferences
  Future<void> deleteData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailList.removeAt(index);
    passwordList.removeAt(index);
    await prefs.setStringList("email", emailList);
    await prefs.setStringList("passwords", passwordList);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
