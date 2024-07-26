import 'dart:developer';

import 'package:flutter/material.dart';

class RadioButtonExample extends StatefulWidget {

  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButtonExample> {


  var gender="M";

  _handleRadio(val)
  {
    setState(() {
      gender=val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
        children: [
          Column(

            children: [
              Radio(value: "M", groupValue: gender,onChanged:_handleRadio),
              Radio(value: "F", groupValue: gender, onChanged: _handleRadio),
              ElevatedButton(onPressed: (){
                log(gender);
              }, child: Text("Submmit")),
            ],
          ),
        ],
      ),
    );
  }
}
