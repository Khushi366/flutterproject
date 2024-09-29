import 'package:flutter/material.dart';

// Custom function to create an Icon Button with optional size parameters and a child
Widget customIconButton({
  IconData? icon,
  VoidCallback? onPressed,
  Color backgroundColor = Colors.grey,
  Color iconColor = Colors.black,
  double? width, // Optional width
  double? height, // Optional height
  Widget? child, // Optional child widget
  bool isCircular = true, // Optional parameter to define shape
  double borderRadius = 0.0, // Optional border radius for rectangle
  Color? borderColor, // Optional border color
  double borderWidth = 0.0, // Optional border width
}) {
  // If width or height are not provided, default to size
  double buttonWidth = width ?? 40.0; // Default width
  double buttonHeight = height ?? 40.0; // Default height

  return Container(
    width: buttonWidth,
    height: buttonHeight,
    decoration: BoxDecoration(
      color: backgroundColor,
      shape: isCircular ? BoxShape.circle : BoxShape.rectangle, // Choose shape based on isCircular
      borderRadius: isCircular ? null : BorderRadius.circular(borderRadius), // Use borderRadius if not circular
      border: borderWidth > 0 ? Border.all(color: borderColor ?? Colors.black, width: borderWidth) : null, // Add border if width > 0
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: iconColor,
          iconSize: buttonHeight * 0.5, // Size of the icon based on height
        ),
        if (child != null) // Add child if provided
          Positioned.fill(child: child),
      ],
    ),
  );
}
