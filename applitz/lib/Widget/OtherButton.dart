
import 'package:applitz/Theme/AppColor.dart';
import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  OtherButton({Key? key,this.height,this.width,required this.onTap,this.color,this.borderRadius,this.icon, this.iconColor,this.iconSize = 24.0,}) : super(key: key);

  double? height;
  double? width;
  VoidCallback? onTap;
  Color? color;
  BorderRadius?borderRadius;
  IconData?icon;
  Color?iconColor;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: color??kPrimaryColor,
            borderRadius: borderRadius??BorderRadius.circular(30),
          ),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    color: iconColor??kWhite,
                    size: iconSize,
            ) : SizedBox(),
          )
        ),
      ),
    );
  }
}