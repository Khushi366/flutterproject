
import 'package:applitz/Theme/AppColor.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key? key,this.height,this.width,required this.title,this.onTap,this.loading=false,this.color,this.borderRadius,this.prefixIcon,this.suffixIcon,}) : super(key: key);

  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  bool loading;
  Color? color;
  BorderRadius?borderRadius;
  IconData?prefixIcon;
  IconData?suffixIcon;


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
          child: loading ? Center(child: CircularProgressIndicator(color: kWhite,)) :Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                prefixIcon != null ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    prefixIcon,
                    color: kWhite,
                  ),
                ) : SizedBox(),

                //Exapnded
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Conditional suffixIcon

                suffixIcon != null ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    suffixIcon,
                    color: kWhite,
                  ),
                ) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}