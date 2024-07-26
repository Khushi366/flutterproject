import 'package:flutter/material.dart';

import '../resources/StyleResources.dart';

class PrimaryButton extends StatelessWidget {
  var btntext = "";
  Color btncolor;
  GestureTapCallback onclick;

  PrimaryButton({required this.btntext,required this.onclick,required this.btncolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onclick,
      child: Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: btncolor,
          ),
          child:Text(btntext,style: StyleResources.BTN_TEXT_STYLE,)),
    );
  }
}
