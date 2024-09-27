import 'package:flutter/material.dart';
import 'package:todolist/Theme/AppColor.dart';

// Define a reusable ElevatedButton as a function
Widget CustomButton({
  required VoidCallback onPressed, // Callback when button is pressed
  required String buttonText,
  double? width,
  var isTablet = false,
}) {
  return SizedBox(
    width: width ?? (isTablet ? 450.0 : 400.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kButtonColor),
        fixedSize: MaterialStateProperty.all(Size(300.0, 45.0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: "SourceSansPro",
          color: kWhite,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
