import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:map/Theme/AppColor.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key? key,this.height,this.width,required this.title,this.onTap,this.loading=false,this.color}) : super(key: key);
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  bool loading;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width??double.infinity,
          decoration: BoxDecoration(
            color: color??kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: loading ? Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}