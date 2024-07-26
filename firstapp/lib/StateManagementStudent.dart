import 'dart:developer';

import 'package:flutter/material.dart';

class StateManagementStudent extends StatefulWidget {
  const StateManagementStudent({super.key});

  @override
  State<StateManagementStudent> createState() => _StateManagementStudentState();
}

class _StateManagementStudentState extends State<StateManagementStudent> {

  var total = "0";
  var per = "0";
  var grade = "abc";

  TextEditingController _rollNo = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _sub1 = TextEditingController();
  TextEditingController _sub2 = TextEditingController();
  TextEditingController _sub3 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Result"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _rollNo,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter RollNo",
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _sub1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Subject 1",
                ),
              ),


              SizedBox(height: 20,),
              TextField(
                controller: _sub2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Subject 2",
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _sub3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Subject 3",
                ),
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    total = (int.parse(_sub1.text) + int.parse(_sub2.text) + int.parse(_sub3.text)).toString();
                    per = (int.parse(total)/3).toString();

                    var  percentage = double.parse(per);
                    log(percentage.toString());

                    if(percentage >= 70){
                      grade="Distic";
                    }else if(percentage >= 60){
                      grade = "First";
                    }else if(percentage >= 50){
                      grade ="Second";
                    }else if(percentage >= 40){
                      grade = "Pass";
                    }else{
                      grade = "Fail";
                    }
                  });
              },
                child: Text("Submit"),
              ),
              Text("RollNo : " + _rollNo.text.toString()),
              Text("Name : " + _name.text.toString()),
              Text("Subject 1 : " + _sub1.text.toString()),
              Text("Subject 2 : " + _sub2.text.toString()),
              Text("Subject 3 : " + _sub3.text.toString()),
              Text("Total : " + total.toString()),
              Text("Per : " + per.toString()),
              Text("Grade : "+grade),
            ],
          ),
        ),
      ),
    );
  }
}
