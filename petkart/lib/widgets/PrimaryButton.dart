import 'package:flutter/material.dart';
import 'package:petkart/Theme/AppColor.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class PrimaryButton extends StatelessWidget {
  var btntext = "";
  Color btncolor;
  GestureTapCallback onclick;
  var width;
  TextStyle? textStyle;

  PrimaryButton({required this.btntext,required this.onclick,required this.btncolor,this.width, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onclick,
      child: Container(
          width: width ?? (DeviceLayout.isTablet(context) ? 390.0 : double.infinity),
          height: 50,
          alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: btncolor,
          ),
          child:Text(btntext, style: textStyle ?? TextStyle(color: kWhite, fontWeight: FontWeight.bold),)),
    );
  }
}
