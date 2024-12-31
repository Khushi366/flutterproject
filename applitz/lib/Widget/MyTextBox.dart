import 'package:applitz/Theme/AppColor.dart';
import 'package:flutter/material.dart';

Widget customeTextBox({
  TextEditingController? controller,
  TextInputType? keyboard,
  String?label,
  String?hintText,
  IconData?prefixIcon,
  IconData?suffixIcon,
  BorderRadius? borderRadius,
  bool obscureText = false,
  IconData icon = Icons.add,
  OutlineInputBorder? focusedBorder,
  OutlineInputBorder? enabledBorder,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
    child: TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon!=null?Icon(prefixIcon):null,
        suffixIcon: suffixIcon!=null?Icon(suffixIcon):null,

        focusedBorder:focusedBorder??
          OutlineInputBorder(
          borderSide: const BorderSide(color: kBlack,),
          borderRadius: borderRadius??BorderRadius.circular(10.0),
          ),

        enabledBorder:enabledBorder??
          OutlineInputBorder(
          borderSide: const BorderSide(color: kBlack,),
          borderRadius: borderRadius??BorderRadius.circular(10.0),
          ),

        labelText: label,
        hintText: hintText??"kkk",
        border:  OutlineInputBorder(
          borderRadius: borderRadius??BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}