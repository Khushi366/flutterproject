import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:map/Theme/AppColor.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key? key,this.height,this.width,required this.title,this.onTap,this.loading=false}) : super(key: key);
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
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