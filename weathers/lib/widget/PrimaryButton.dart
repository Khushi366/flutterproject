import 'package:flutter/material.dart';
import 'package:weathers/Theme/AppColors.dart';
import 'package:weathers/Theme/DeviceLayout.dart';

class PrimaryButton extends StatelessWidget {
  final String btntext;
  final Color btncolor;
  final GestureTapCallback onclick;
  final double? width;
  final TextStyle? textStyle;

  PrimaryButton({
    required this.btntext,
    required this.onclick,
    required this.btncolor,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: width ?? (DeviceLayout.isTablet(context) ? 390.0 : double.infinity),
        height: 50,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: btncolor,
        ),
        child: Text(
          btntext,
          style: textStyle ?? TextStyle(
            color: kPrimaryButtonText, // Default text color
            fontWeight: FontWeight.bold, // Default font weight
            fontSize: 16, // Default font size
          ),
        ),
      ),
    );
  }
}
