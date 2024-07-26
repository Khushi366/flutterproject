import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class IntroTwo extends StatelessWidget {
  const IntroTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height *0.1),
            Image.asset("assets/img/introsecondtwo.png",
              width: DeviceLayout.isTablet(context) ? 400.0 : 280.0,
              height: DeviceLayout.isTablet(context) ? 335.0 : 235.0,),
              SizedBox(height: Get.height *0.1),
              Text("Choose a PetKart: Fish and Birds",style: Get.textTheme.titleLarge),
              SizedBox(height: 20.0),
              Text("Shop PetKart online for a variety of fish toys and nutritious food,"
                  " ensuring your aquatic pets thrive with quick and convenient delivery."
                  "discover premium bird nests and nourishing food at PetKart, your go-to for quality products and quick delivery.",
                style: Get.textTheme.bodySmall!.copyWith(color: kgrey,),textAlign: TextAlign.center,),
              SizedBox(height: Get.height *0.1),
            ],
          ),
        ),
      ),
    );
  }
}
