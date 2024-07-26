import 'dart:developer';

import 'package:flutter/material.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {

  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();


  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextForm Field"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text("Number 1"),
              TextFormField(
                controller: _num1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    )
                ),
                validator: (val)
                {
                  if(val!.isEmpty)
                    {
                      return "Please Enter Number 1";
                    }
                  if(int.parse(val)<=18)
                    {
                      return "Please netr value greter than 100";
                    }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              Text("Number 2"),
              TextFormField(
                controller: _num2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    )
                ),
                validator: (val)
                {
                  if(val!.isEmpty)
                  {
                    return "Please Enter Number 2";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              Container(
                width: 400.0,
                child: ElevatedButton(
                  onPressed: (){
                    if(formkey.currentState!.validate())
                      {
                        var n1 = _num1.text.toString();
                        var n2 = _num2.text.toString();
                        var total = int.parse(n1) + int.parse(n2);
                        log("Total = " + total.toString());
                      }
                  }, child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
