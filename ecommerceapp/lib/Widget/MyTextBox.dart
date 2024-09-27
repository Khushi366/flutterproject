import 'package:flutter/material.dart';
// Define a reusable CustomTextField as a function
Widget CustomTextField({
  var controller,
  var hintText,
  var maxLines = 1,
  double? width,
  var keyboardType = TextInputType.text,
  var isTablet = false,
  Color focusedBorderColor = Colors.blue
}) {
  return SizedBox(
    width: width ?? (isTablet ? 450.0 : 400.0),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder( // Customize focused border
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: focusedBorderColor), // Color when focused
        ),
        hintText: hintText,

      ),
    ),
  );
}
