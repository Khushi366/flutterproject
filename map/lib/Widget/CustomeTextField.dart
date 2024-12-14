 import 'package:flutter/material.dart';

 Widget customeTextBox({
  String? label,
  String ?hintText,
  ValueChanged? onChanged,
  IconData icon = Icons.add,
  TextEditingController? controller,
  TextInputType? keyboard,
  bool obscureText = false,
  IconData?suffixIcon,
  VoidCallback? onTap,

 }) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboard,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon!=null?Icon(suffixIcon):null,
     //  label: Text(label),
      //  prefixIcon: Icon(icon),
      //  hintText: 'Type $label here',
        hintText: hintText??"kkk",
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}