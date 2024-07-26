import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: Get.height *0.1),
              Center(
                  child: Image.asset(
                    "assets/img/intro1.png",              //teablet  //mobile
                    width: DeviceLayout.isTablet(context) ? 400.0 : 280.0,
                    height: DeviceLayout.isTablet(context) ? 335.0 : 235.0,
                  )
              ),
              SizedBox(height: Get.height *0.1),
              Text("Online PetKart Store",style: Get.textTheme.titleLarge),
              SizedBox(height: 20.0),
              Text("Welcome to PetKart, your one-stop online store for all your cat's needs. "
                  "From high-quality food and entertaining toys to cozy beds and stylish accessories, "
                  "we offer top brands and reliable products. Enjoy easy shopping with fast shipping and excellent customer service.",
                style: Get.textTheme.bodySmall!.copyWith(color: kgrey,),textAlign: TextAlign.center,),
              SizedBox(height: Get.height *0.1),
            ],
          ),
        ),
      ),
    );
  }
}

