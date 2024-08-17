import 'package:flutter/material.dart';

class Addition extends StatefulWidget {
  const Addition({super.key});

  @override
  State<Addition> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  var result = "";

  void addNumbers()
  {
    var number1 = int.parse(num1.text);
    var number2 = int.parse(num2.text);
    var sum =  number1 + number2;
    setState(() {
      result = "Sum: $sum";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            Text("Num 1"),
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20.0,),
            Text("Num 2"),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,

            ),
            SizedBox(height: 20.0,),
            Center(
                child: ElevatedButton(
                    onPressed: addNumbers,
                    child: Text("Submit")),
            ),

            SizedBox(height: 20.0,),
            Center(
              child: Text(
                result,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
