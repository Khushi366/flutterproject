
import 'package:applitz/Theme/AppColor.dart';
import 'package:flutter/material.dart';

Widget formField({

  TextEditingController? controller,
  TextInputType? keyboard,
  String?label,
  String?hintText,
  //Icon? icon,
  int? maxLines,
  IconData?prefixIcon,
  IconData?suffixIcon,
  BorderRadius? borderRadius,
  bool obscureText = false,
  IconData icon = Icons.add,
  OutlineInputBorder? focusedBorder,
  OutlineInputBorder? enabledBorder,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please type the $label above';
        }
      },
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
        hintText: hintText,
        border:  OutlineInputBorder(
          borderRadius: borderRadius??BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}