import 'package:flutter/material.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {

  var result = "0";
  var name = "abc";


  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();


  var calculate = "+";

  _handelRadio(val){
    setState(() {
      calculate = val;
    });
  }

  void _calculateResult(){
   setState(() {

     switch(calculate){
       case "+":
         result = (int.parse(_num1.text) + int.parse(_num2.text)).toString();
         name = "Addition";
         break;

       case "-":
         result = (int.parse(_num1.text) - int.parse(_num2.text)).toString();
         name = "Subtraction";
         break;
       case "*":
         result = (int.parse(_num1.text) * int.parse(_num2.text)).toString();
         name = "Multiplication";
         break;

       case "/":
         result = (double.parse(_num1.text) / double.parse(_num2.text)).toString();
         name = "Divided";
         break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioButtonScreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Number 1"
              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Number 1"
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(value: "+", groupValue: calculate, onChanged: _handelRadio),
                    Text("+"),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: "-", groupValue: calculate, onChanged: _handelRadio),
                    Text("-"),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: "*", groupValue: calculate, onChanged: _handelRadio),
                    Text("*"),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: "/", groupValue: calculate, onChanged: _handelRadio),
                    Text("/"),
                  ],
                ),
              ],
            ),

            ElevatedButton(
              onPressed: (){
                _calculateResult();
              }, child: Text("Submit"),
            ),

            Container(
              height: 40.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
                child: Center(
                    child: Text("$name : "+ result,style: TextStyle(color: Colors.white,fontSize: 18.0),),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
