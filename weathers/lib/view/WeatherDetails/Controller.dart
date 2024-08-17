import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathers/Service/ApiService.dart';

class WeatherDetailController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  var weatherData = {}.obs;

  Future<void> fetchWeatherData() async {
    try {
      var city = cityController.text;
      var params = {
        "q": city,
        "key": "3f331f7d84824ff5a6e45304243107",  // Your actual API key
        "days": 7,
        "lang": "en"
      };
      var data = await ApiServices.weatherData(params);
      weatherData.value = data;
      log('Weather data fetched: ${weatherData.value}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
