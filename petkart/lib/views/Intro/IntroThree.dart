import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class IntroThree extends StatelessWidget {
  const IntroThree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height *0.1),
                    Center(
                      child: Image.asset("assets/img/introthreecopy1.png",
                        width: DeviceLayout.isTablet(context) ? 400.0 : 280.0,
                        height: DeviceLayout.isTablet(context) ? 335.0 : 235.0,),
                    ),
                    SizedBox(height: Get.height *0.1),
                    Text("Pick Up Delivery",style: Get.textTheme.titleLarge),
                    SizedBox(height: 20.0),
                    Text("PetKart now offers convenient pickup and delivery services for all "
                        "your pet needs. Choose from a wide range of products for fish and birds,"
                        " and have them delivered straight to your door. Enjoy hassle-free shopping with PetKart's"
                        " reliable and efficient delivery options.",
                      style: Get.textTheme.bodySmall!.copyWith(color: kgrey,),textAlign: TextAlign.center,),
                    SizedBox(height: Get.height *0.1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
