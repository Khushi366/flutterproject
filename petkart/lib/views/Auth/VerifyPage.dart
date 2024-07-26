import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/Notification.dart';
import 'package:petkart/widgets/SecondaryButton.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceLayout.isTablet(context);
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
                  Text("Verify", style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCircle("1"),
                      buildCircle("2"),
                      buildCircle("3"),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: kgrey, shape: BoxShape.circle,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text("We texted you a code to verify", style: Get.textTheme.bodySmall!.copyWith(color: kgrey,fontWeight: FontWeight.bold)),
                  Text("your phone number", style: Get.textTheme.bodySmall!.copyWith(color: kgrey,fontWeight: FontWeight.bold)),

                  SizedBox(height: 20.0),
                  Text("Didn't receive code?", style: Get.textTheme.titleLarge),
                  SizedBox(height: 30.0),
                  SecondaryButton(
                   // width: 120.0,
                    btntext: "Resend",textStyle: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    onclick: () {
                      // Implement your login logic here
                    },
                    btncolor: kWhite,
                    border: Border.all(color: Colors.black, width: 1.0),

                  ),
                  SizedBox(height: isTablet ? 50.0 : Get.height * 0.3),
                  SecondaryButton(
                  //  width: 120.0,
                    btntext: "Next",
                    onclick: () {
                      // Implement your login logic here
                      Get.defaultDialog(
                        backgroundColor: kWhite,
                        title: "",
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: kPrimaryColorDark,
                              size: 45,
                            ),
                            SizedBox(height: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Account Created!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    "Your account has",
                                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "been successfully created!",
                                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        confirm: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColorDark,
                            minimumSize: Size(double.infinity, 40),
                          ),
                          onPressed: () => Get.to(NotificationPage()),

                          child: Text("Continue", style: TextStyle(color: kWhite),),
                        ),
                      );
                    },
                    btncolor: kPrimaryColorDark,
                    border: Border.all(color: Colors.black, width: 2.0),
                    suffixIcon: Icon(Icons.arrow_forward, color: kWhite,size: 20.0,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCircle(String text) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: kPrimaryColorDark,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: Get.textTheme.titleLarge!.copyWith(color: kWhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
