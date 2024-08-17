
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_practice/Theme/AppColor.dart';


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

}) {
  return Padding(
    padding: padding ?? EdgeInsets.all(0), // Use the optional padding
    child: Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent, // Use the optional background color
        borderRadius: BorderRadius.circular(10.0), // Match the border radius of the text field
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText ?? "",
          hintStyle:  TextStyle(color: kGrey),
          contentPadding: hintPadding ?? EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0), // Optional hint text padding
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlack),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGrey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: leadingIcon,
          suffixIcon: trailingIcon,
        ),
        cursorColor: kBlack,
        style: TextStyle(fontSize: 14),
      ),
    ),
  );
}
