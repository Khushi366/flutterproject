import 'dart:developer';

import 'package:flutter/material.dart';

class SecondScreenExample extends StatefulWidget {

  var name="";
  var age="";
  SecondScreenExample({required this.name,required this.age});

  @override
  State<SecondScreenExample> createState() => _FirstScreenExampleState();
}

class _FirstScreenExampleState extends State<SecondScreenExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("Second screen load");
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log("Screen back");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(widget.name.toString(),style: TextStyle(
              color: Colors.black
            ),),
            Text(widget.age.toString(),style: TextStyle(
                color: Colors.black
            ),),
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).pop();

              }, child: Text("Back"),
            ),
          ],
        ),
      ),

    );
  }
}
