import 'dart:math';

import 'package:flutter/material.dart';

class StudentResultTexformfiled extends StatefulWidget {
  const StudentResultTexformfiled({super.key});

  @override
  State<StudentResultTexformfiled> createState() => _StudentResultTexformfiledState();
}

class _StudentResultTexformfiledState extends State<StudentResultTexformfiled> {

  TextEditingController _rollno = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _sub1 = TextEditingController();
  TextEditingController _sub2 = TextEditingController();
  TextEditingController _sub3 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student result"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _rollno,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Rollno.",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _sub1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Subject 1",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _sub2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Subject 2",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                ),
              ),


              SizedBox(height: 20,),
              TextField(
                controller: _sub3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Subject 3",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                ),
              ),


              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

                  var s1 = _sub1.text.toString();
                  var s2 = _sub2.text.toString();
                  var s3 = _sub3.text.toString();

                  var total = int.parse(s1) + int.parse(s2) +int.parse(s3);
                  var per = total /3;
                  print(" rollno = " + _rollno.text.toString());
                  print(" name = " + _name.text.toString());
                  print(" sub 1 = " + _sub1.text.toString());
                  print(" sub 2 = " + _sub2.text.toString());
                  print(" sub 3 = " + _sub3.text.toString());
                  print(" total = " + total.toString());
                  print("per = " + per.toString());

                  if(per >= 70){
                    print("Destic");
                  }else if(per >= 60){
                    print("First");
                  }else if(per >= 50){
                    print("Second");
                  }else if(per >= 40){
                    print("Pass");
                  }else{
                    print("Fail");
                  }

              },
                child: Text("Submit"),
              )

            ],
          ),
        ),
      ),
    );
  }
}
