import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/ConditionPage.dart';
import 'package:petkart/views/Auth/Login.dart';
import 'package:petkart/widgets/SecondaryButton.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceLayout.isTablet(context);
    var logoSize = isTablet ? 160.0 : 130.0;
    // var spacing = isTablet ? 40.0 : 20.0;
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Container(
              width: isTablet ? 400.0 : double.infinity,
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 350.0 : Get.height * 0.2),
                  Text("PetKart", style: Get.textTheme.headlineMedium),
                  SizedBox(height: isTablet ? 50.0 : 50.0),
                  Icon(
                      Icons.circle_notifications_rounded,size: logoSize,color: kPrimaryColorDark,
                  ),

                  SizedBox(height: 30.0),
                  Text("Notifications", style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),

                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Expanded(child: Text("Stay informed with PetKart notifications, keeping you updated on order status and exclusive offers. Never miss a beat with timely alerts for all your pet needs.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  SecondaryButton(
                  btncolor: kPrimaryColorDark,
                  btntext: "Allow",
                  onclick: () {
                    Get.to(Login());
                  }),
                  SizedBox(height: 10.0),
                  InkWell(
                      onTap: (){

                        Get.to(ConditionsPage());
                      },
                      child: Text("Skip", style: Get.textTheme.titleLarge!.copyWith(color:kPrimaryColorDark))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
