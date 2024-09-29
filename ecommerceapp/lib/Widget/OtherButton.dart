
import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:ecommerceapp/Widget/SecondaryButton.dart';
import 'package:flutter/material.dart';

Widget buildIconButton({
  required IconData icon,
  required VoidCallback onPressed,
  Color? backgroundColor,
  double? height, // Optional height parameter

}) {
  return customIconButton(
    icon: icon,
    onPressed: onPressed,
    backgroundColor: backgroundColor ?? kGeryLightColor!,
    iconColor: kBlack,
    height: height, // Pass the height to customIconButton
  );
}