import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathers/Theme/AppColors.dart';
import 'package:weathers/Theme/AppThems.dart';
import 'package:weathers/Theme/DeviceLayout.dart';

Widget customTextField({
  BuildContext? context,
  String? hintText,
  bool obscureText = false,
  TextEditingController? controller,
  TextInputType? keyboardType,
  Color? backgroundColor,
  double? height,
  double? width,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? hintPadding,
  Widget? leadingIcon,
  Widget? trailingIcon,
  Color? hintTextColor, // Add hintTextColor parameter
  double? hintTextSize, // Add hintTextSize parameter
}) {
  var titleLarge = context != null
      ? Theme.of(context).textTheme.titleLarge
      : AppTheme.light.textTheme.titleLarge;

  return Padding(
    padding: padding ?? EdgeInsets.all(0),
    child: Container(
      width: width ??
          (context != null
              ? (DeviceLayout.isTablet(context)
              ? 400.0
              : 400.0)
              : 280.0),
      height: height ?? 60.0,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText ?? "",
          hintStyle: titleLarge?.copyWith(
            color: hintTextColor ?? kGrey, // Use the hintTextColor parameter or default to kGrey
            fontSize: hintTextSize ?? 14, // Use the hintTextSize parameter or default to 14
          ),
          contentPadding: hintPadding ?? EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlack),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGrey),
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: leadingIcon,
          suffixIcon: trailingIcon,
        ),
        cursorColor: kBlack,
        style: titleLarge?.copyWith(fontSize: 14), // Adjust fontSize if needed
      ),
    ),
  );
}
