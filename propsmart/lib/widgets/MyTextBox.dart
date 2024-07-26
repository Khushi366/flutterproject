import 'package:flutter/material.dart';
import 'package:propsmart/resources/DimenResources.dart';

class MyTextBox extends StatelessWidget {

  var hinttext;
  TextInputType keywordType;
  TextEditingController controller;
  bool password;


   MyTextBox({required this.hinttext,required this.keywordType,required this.controller, this.password = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keywordType,
      obscureText: password,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hinttext,
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF294357)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF233645)),
          borderRadius: BorderRadius.circular(DimenResources.TXT_RADIUS),
        ),
      ),
      cursorColor: Color(0xFF233645),
    );
  }
}
