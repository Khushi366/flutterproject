import 'package:flutter/material.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxExample> {


  var ch1=true;
  var ch2=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Column(
        children: [
          Checkbox(
              value: ch1,
              activeColor: Colors.green,
              checkColor: Colors.black,
              onChanged: (val){
            setState(() {
              ch1=val!;
            });
          }),
          Checkbox(
              value: ch2,
              onChanged: (val){
            setState(() {
              ch2=val!;
            });
          }),
        ],
      ),
    );
  }
}
