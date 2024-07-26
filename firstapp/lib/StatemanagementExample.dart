import 'dart:developer';

import 'package:flutter/material.dart';

class StatemanagementExample extends StatefulWidget {
  const StatemanagementExample({super.key});

  @override
  State<StatemanagementExample> createState() => _StatemanagementExampleState();
}

class _StatemanagementExampleState extends State<StatemanagementExample> {

  var name = "ABC";

  TextEditingController _firstname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(name),
            TextField(
              controller: _firstname,
            ),
            ElevatedButton(onPressed: (){


              setState(() {
                name=_firstname.text.toString();
              });


            }, child: Text("Submit")),
            Text(name),
          ],
        ),
      ),
    );
  }
}
