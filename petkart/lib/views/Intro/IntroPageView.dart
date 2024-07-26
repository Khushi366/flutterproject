import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';
import 'package:petkart/views/Auth/Login.dart';
import 'package:petkart/widgets/PrimaryButton.dart';
import 'IntroController.dart';
import 'IntroOne.dart';
import 'IntroThree.dart';
import 'IntroTwo.dart';

class IntroPageView extends StatelessWidget {
  final introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: PageController(),
            onPageChanged: introController.onPageChanged,
            itemCount: 3,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return IntroOne();
                case 1:
                  return IntroTwo();
                case 2:
                  return IntroThree();
                default:
                  return IntroOne();
              }
            },
          ),
          Positioned(
            bottom: DeviceLayout.isTablet(context) ? 400.0 : 90.0,
            left: 0.0,
            right: 0.0,
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                double size = 15.0;
                Color indicatorColor = kgrey;
                Border? border;
                if (introController.currentPageIndex.value == 0) {
                  switch (index) {
                    case 0:
                      indicatorColor = kBlack;
                      size = 18.0;
                      break;
                    case 1:
                      indicatorColor = kgrey;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                    case 2:
                      indicatorColor = kWhite;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                  }
                } else if (introController.currentPageIndex.value == 1) {
                  // First circle: white, second: black, third: grey
                  switch (index) {
                    case 0:
                      indicatorColor = kWhite;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                    case 1:
                      indicatorColor = kBlack;
                      size = 18.0;
                      break;
                    case 2:
                      indicatorColor = kgrey;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                  }
                } else if (introController.currentPageIndex.value == 2) {
                  switch (index) {
                    case 0:
                      indicatorColor = kWhite;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                    case 1:
                      indicatorColor = kWhite;
                      border = Border.all(
                        color: kgrey,
                        width: 2.0,
                      );
                      break;
                    case 2:
                      indicatorColor = kBlack;
                      size = 18.0;
                      break;
                  }
                }

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: indicatorColor,
                    shape: BoxShape.circle,
                    border: border,
                  ),
                );
              }),
            )),
          ),
          Positioned(
            bottom: DeviceLayout.isTablet(context) ? 300.0 : 5.0,
            left: 0.0,
            right: 0.0,
            child: Obx(() {
              if (introController.currentPageIndex.value == 2) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: PrimaryButton(
                      btntext: "Get Started",
                      onclick: () {
                        Get.to(Login());
                      },
                      btncolor: kPrimaryColorDark,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}
