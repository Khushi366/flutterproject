import 'package:applitz/Theme/AppColor.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    Key? key,
    this.height,
    this.width,
    required this.title,
    required this.onPressed, // Required onPressed callback
    this.loading = false,
    this.color,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  double? height;
  double? width;
  String title;
  VoidCallback onPressed; // onPressed for button click handling
  bool loading;
  Color? color;
  BorderRadius? borderRadius;
  IconData? prefixIcon;
  IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color ?? kBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(30),
              ),
            ),
          ),
          onPressed: loading ? null : onPressed, // Disable when loading
          child: loading
              ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kWhite),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              prefixIcon != null?
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(prefixIcon, color: kWhite),
                ): SizedBox(),
              Text(
                title,
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              suffixIcon != null?
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(suffixIcon, color: kWhite),
                ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
