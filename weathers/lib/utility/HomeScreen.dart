import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathers/Theme/AppColors.dart';
import 'package:weathers/view/WeatherDetails/Controller.dart';
import 'package:weathers/view/WeatherDetails/Screen.dart';
import 'package:weathers/widget/MyTextBox.dart';
import 'package:weathers/widget/PrimaryButton.dart';

class MyHomeScreen extends StatelessWidget {
  final WeatherDetailController controller = Get.put(WeatherDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColorDark,
              kPrimaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 80.0),
                Image.asset(
                  "assets/img/weather.png",
                  width: 250,
                  height: 250,
                ),
                SizedBox(height: 30.0),
                Text(
                  "Weather",
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontSize: 26.0,
                    color: kWhite,
                    fontFamily: "Regular",
                    fontWeight: FontWeight.bold,
                    decorationThickness: 2.0,
                  ),
                ),
                Text(
                  "ForeCasts",
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontSize: 26.0,
                    color: kPrimaryButton,
                    fontFamily: "Regular",
                    decorationThickness: 2.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextField(
                      controller: controller.cityController,
                      hintText: "Add City",
                      hintTextSize: 12,
                      hintTextColor: kGrey,
                      backgroundColor: kWhite,
                      height: 42,
                      width: 140,
                      padding: EdgeInsets.only(right: 10),
                      hintPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                PrimaryButton(
                  btntext: 'Enter City',
                  onclick: () async {
                    final city = controller.cityController.text.trim();

                    city.isNotEmpty
                        ? await controller.fetchWeatherData().then((_) {
                      controller.weatherData.value != null
                          ? Get.to(
                        WeatherDetailScreen(),
                        arguments: controller.weatherData.value,
                      )!.then((_) => controller.cityController.clear())
                          : Get.snackbar(
                        'Error',
                        'No data available',
                        snackPosition: SnackPosition.BOTTOM,
                     
                        // /snackStyle: SnackStyle.FLOATING,
                      );
                    })
                        : Get.snackbar(
                      'Please',
                      'City name cannot be empty',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  btncolor: kPrimaryButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
