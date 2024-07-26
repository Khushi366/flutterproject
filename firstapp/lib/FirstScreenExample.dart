import 'package:firstapp/SecondScreenExample.dart';
import 'package:flutter/material.dart';

class FirstScreenExample extends StatefulWidget {
  const FirstScreenExample({super.key});

  @override
  State<FirstScreenExample> createState() => _FirstScreenExampleState();
}

class _FirstScreenExampleState extends State<FirstScreenExample> {

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter name",
              ),
            ),

            ElevatedButton(
                onPressed: () {
                //  Navigator.of(context).pushNamed("/second");
                 // Navigator.of(context).pop();//First screen remove


                  var nm = _name.text.toString();


                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SecondScreenExample(
                      name: nm,
                      age: "25",
                    ))
                  );

               }, child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
