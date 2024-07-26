import 'dart:math';

import 'package:flutter/material.dart';

import 'StudentNavigationsViewScreen.dart';

class StudentNavigationsScreen extends StatefulWidget {
  const StudentNavigationsScreen({super.key});

  @override
  State<StudentNavigationsScreen> createState() => _StudentNavigationsScreenState();
}

class _StudentNavigationsScreenState extends State<StudentNavigationsScreen> {

  var total = "0";
  var per = 0.0;
  var grade;


  TextEditingController _roll = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _sub1 = TextEditingController();
  TextEditingController _sub2 = TextEditingController();
  TextEditingController _sub3 = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _roll,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter rollno."
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter name."
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _sub1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter subject1."
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _sub2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter subject2."
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _sub3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter subject3."
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: (){

                  total = (int.parse(_sub1.text)+ int.parse(_sub2.text) + int.parse( _sub3.text)).toString();
                  print(total);

                  per = double.parse(total) /3;
                  print(per);

                  if(per >= 70){
                    grade = "Distic";
                  }else if(per >= 60){
                    grade = "First";
                  }else if(per >= 50){
                    grade = "Second";
                  }else if(per >= 40){
                    grade = "Pass";
                  }else{
                    grade ="Fail";
                  }
                  print(grade);

                  //var nam =  _name.text.toString();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StudentNavigationsViewScreen(

                     roll: _roll.text.toString(),
                     name: _name.text.toString(),
                      sub1: _sub1.text.toString(),
                      sub2: _sub2.text.toString(),
                      sub3: _sub3.text.toString(),
                      total:  total,
                      per: per.toStringAsFixed(2),
                      grade: grade,

                    )));


              }, child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
