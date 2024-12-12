 import 'package:flutter/material.dart';

 Widget formField({
  String? label,
  String ?hintText,
  ValueChanged? onChanged,
  Icon? icon,
  TextEditingController? controller,
  TextInputType? keyboard,
  bool obscureText = false

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboard,
      obscureText: obscureText,
      decoration: InputDecoration(
     //  label: Text(label),
        prefixIcon: icon,
      //  hintText: 'Type $label here',
        hintText: hintText??"kkk",
        border: const OutlineInputBorder(),
      ),
    ),
  );
}