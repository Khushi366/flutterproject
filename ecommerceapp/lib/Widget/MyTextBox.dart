import 'package:ecommerceapp/Theme/AppColor.dart';
import 'package:flutter/material.dart';
// Define a reusable CustomTextField as a function
Widget CustomTextField({
  var controller,
  var hintText,
  var maxLines = 1,
  double? width,
  var keyboardType = TextInputType.text,
  var isTablet = false,
  Color focusedBorderColor = kButtonColor,
  Color hintTextColor = kGeryColor,
  Color backgroundColor = kGeryLightColor,
  Color? enabledBorderColor,
  double borderRadius = 10.0,
  double? height,
  Icon? leadingIcon,
  Icon? trailingIcon,
  bool showDivider = false,
  Widget? child,
}) {
  return SizedBox(
    width: isTablet ? 400: 400.0,
    height: height ?? 56.0,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true, // Enable filling the background
        fillColor: backgroundColor, // Set the background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder( // Customize enabled border
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: enabledBorderColor ?? kGeryLightColor), // Default to grey if not specified
        ),
        focusedBorder: OutlineInputBorder( // Customize focused border
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor), // Color when focused
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: kGeryColor, // Set the hint text color
        ),
        prefixIcon: leadingIcon != null ? leadingIcon : null,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Minimize space taken by Row
            children: [
              if (showDivider)
              Container(
                height: 30, // Set a height for the divider
                child: VerticalDivider(
                  thickness: 1, // Thickness of the vertical line
                  color: kGeryColor, // Color of the vertical line
                  width: 30, // Width of the vertical line space
                ),
              ),
              if (trailingIcon != null) trailingIcon, // Only show trailing icon if it's not null
              if (child != null) // Add the child widget if provided
                child,
            ],
          ),
        ),
      ),
    ),
  );
}
