// // lib/custom_text_field.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:petkart/Theme/AppColor.dart';
// import 'package:petkart/Theme/DeviceLayout.dart';
//
// Widget customTextField({
//   BuildContext? context,
//   String? hintText,
//   bool obscureText = false,
//   TextEditingController? controller,
//   TextInputType? keyboardType,
//   Color? backgroundColor,
//   double? height,
//   double? width,
// })
// {
//   var titleLarge = context != null ? Theme.of(context).textTheme.titleLarge : TextStyle();
//
//   return Container(
//     width: context != null
//         ? (DeviceLayout.isTablet(context) ? 400.0 // Smaller width for tablets
//         : 400.0) // Larger width for mobile devices
//         : 280.0,
//     decoration: BoxDecoration(
//       color: backgroundColor ?? Colors.transparent, // Use the optional background color
//       borderRadius: BorderRadius.circular(10.0), // Match the border radius of the text field
//     ),
//     child: TextField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: hintText ?? "",
//           hintStyle: titleLarge!.copyWith(color: kgrey),
//         contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: kBlack),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: kgrey),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//       cursorColor: kBlack,
//       style: TextStyle(fontSize: 14,),
//     ),
//   );
// }
// lib/custom_text_field.dart

// lib/custom_text_field.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

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
  var titleLarge = context != null ? Theme.of(context).textTheme.titleLarge : TextStyle();

  return Padding(
    padding: padding ?? EdgeInsets.all(0), // Use the optional padding
    child: Container(
      width: width ??
          (context != null
              ? (DeviceLayout.isTablet(context) ? 400.0 // Default width for tablets
              : 400.0) // Default width for mobile devices
              : 280.0), // Default width if context is null
      height: height ?? 60.0, // Default height
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
          hintStyle: titleLarge!.copyWith(color: kgrey),
          contentPadding: hintPadding ?? EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0), // Optional hint text padding
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlack),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kgrey),
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
