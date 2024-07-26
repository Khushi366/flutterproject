import 'package:flutter/material.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class SecondaryButton extends StatelessWidget {
  var btntext = "";
  Color btncolor;
  GestureTapCallback onclick;
  var width;
  var height;
  TextStyle? textStyle;
  Border? border;
  Icon? suffixIcon;


  SecondaryButton({
    required this.btntext,
    required this.onclick,
    required this.btncolor,
    this.width,
    this.height,
    this.textStyle,
    this.border,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onclick,
      child: Container(
          width: width ?? (DeviceLayout.isTablet(context) ? 150.0 : 90),
          height: height,
          alignment: Alignment.center,

          // margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: btncolor,
            border: border,

          ),
          child:Row(
            //mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(btntext, style: textStyle ?? TextStyle(color: kWhite, fontWeight: FontWeight.bold),),
              if (suffixIcon != null) SizedBox(width: 10.0),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
      ),
    );
  }
}
