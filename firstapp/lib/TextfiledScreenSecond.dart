import 'dart:developer';
import 'package:flutter/material.dart';

class TextfiledScreenSecond extends StatefulWidget {
  const TextfiledScreenSecond({super.key});

  @override
  State<TextfiledScreenSecond> createState() => _TextfiledScreenSecondState();
}

class _TextfiledScreenSecondState extends State<TextfiledScreenSecond> {


  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfiled"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Number 1"),
            TextField(
              controller: _num1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                )
              ),
            ),
            SizedBox(height: 30,),
            Text("Number 2"),
            TextField(
              controller: _num2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                  )
              ),
            ),

            SizedBox(height: 30,),
            Container(
              width: 400.0,
              child: ElevatedButton(
                onPressed: (){


                  var n1 = _num1.text.toString();
                  var n2 = _num2.text.toString();

                  var total = int.parse(n1) + int.parse(n2);

                  log("Total = " + total.toString());


                }, child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
