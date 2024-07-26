import 'dart:developer';

import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtonExample> {


  var state = "GJ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButton"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton(
              value: state,
              items: [
                DropdownMenuItem(child: Text("Gujarat"),value: "GJ",),
                DropdownMenuItem(child: Text("Maharstra"),value: "MH",),
                DropdownMenuItem(child: Text("Punjab"),value: "PJ",),
              ],
              onChanged: (val)
              {
                setState(() {
                  state=val!;
                });
              },
            ),
            ElevatedButton(onPressed: (){

              var snackbar = SnackBar(
                  content: Text("This is Message"),
                backgroundColor: Colors.green,
                action:SnackBarAction(
                  label: "Undo",
                  textColor: Colors.blue,
                  onPressed: (){

                  },
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackbar);

             // log(state.toString());

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
