import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:flutter/material.dart';
// Define a reusable ElevatedButton as a function
Widget CustomButton({
  required VoidCallback onPressed, // Callback when button is pressed
  required String buttonText,
  double? width, // Optional width
  double? height, // Optional height
  Color? color,
  Color? textColor,
  double? borderRadius, // Optional borderRadius
  double? textSize,
  bool isTablet = false, // Use bool for isTablet, default is false
}) {
  return SizedBox(
    width: width ?? (isTablet ? 450.0 : 400.0), // Default width for tablet or phone
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? kButtonColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: height != null ? height / 2 : 12.0, // Half of the height for vertical padding
            horizontal: 16.0, // You can adjust horizontal padding as needed
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 10.0, // Use provided borderRadius or default to 10.0
            ),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? kWhite,
          fontSize: textSize ?? 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
