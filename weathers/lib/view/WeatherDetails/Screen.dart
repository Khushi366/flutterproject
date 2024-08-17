import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathers/Theme/AppColors.dart';

class WeatherDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Getting the weather data passed as an argument
    final weatherData = Get.arguments;

    // Extracting forecast data
    final forecastDays = weatherData?['forecast']['forecastday'] ?? [];

    return Container(
      color: kPrimaryColorSafe,
      child: SafeArea(
        child: Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: weatherData != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '${weatherData['location']['name']}',
                      style: Get.textTheme.bodyLarge!.copyWith(color: kWhite,fontFamily: "Regular")),
                  SizedBox(height: 40),

                  Image.asset("assets/img/weather.png",scale: 4,),

                  Text(
                    '${weatherData['current']['temp_c']}°C',
                      style: Get.textTheme.titleLarge!.copyWith(color: kWhite,fontWeight:FontWeight.bold,fontSize: 42,fontFamily: "Regular")
                  ),
                  SizedBox(height: 16),

                  Text(
                    '${weatherData['current']['condition']['text']}',
                      style: Get.textTheme.titleLarge!.copyWith(color: kWhite,fontWeight:FontWeight.bold,fontSize: 14,fontFamily: "Regular")
                  ),

                  SizedBox(height: 50),

                  Expanded(
                    child: ListView.builder(
                      itemCount: forecastDays.length,
                      itemBuilder: (context, index) {
                        final day = forecastDays[index];
                        final conditionIconUrl = day['day']['condition']['icon'];

                        return ListTile(
                        //  contentPadding: EdgeInsets.all(16.0),
                          leading: conditionIconUrl != null
                              ? Image.network(
                            'http:${conditionIconUrl}',
                            width: 50,
                            height: 50,
                          )
                              : SizedBox(width: 50, height: 50),
                          title: Text(
                            '${day['date']}',
                              style: Get.textTheme.bodySmall!.copyWith(color: kWhite,fontSize: 14,fontFamily: "Regular")
                          ),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${day['day']['condition']['text']} - ',style: Get.textTheme.titleLarge!.copyWith(color: kWhite,fontSize: 14,fontFamily: "Regular")
                              ),
                              Text('Temp: ${day['day']['avgtemp_c']}°C', style: Get.textTheme.titleLarge!.copyWith(color: kWhite,fontSize: 14,fontFamily: "Regular")
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
                  : Center(
                child: Text(
                  'No weather data available.',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
