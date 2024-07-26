
import 'package:flutter/material.dart';

class StudentNavigationsViewScreen extends StatefulWidget {

  var roll = "";
  var name = "";
  var sub1 = "";
  var sub2 = "";
  var sub3 = "";
  var total = "";
  var per = "";
  var grade = "";



  StudentNavigationsViewScreen({
    required this.roll,
    required this.name,
    required this.sub1,
    required this.sub2,
    required this.sub3,
    required this.total,
    required this.per,
    required this.grade});

  @override
  State<StudentNavigationsViewScreen> createState() => _StudentNavigationsViewScreenState();
}

class _StudentNavigationsViewScreenState extends State<StudentNavigationsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details View"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [

              SizedBox(
                height: 230.0,
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name: "+widget.name.toString(),style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),

                              Padding(
                                padding: const EdgeInsets.only(right: 50.0),
                                child: Text("RollNo: "+widget.roll.toString()),
                              ),

                            ],
                          ),
                          Divider(color: Colors.black,height: 50,thickness: 1,indent: 10,endIndent: 10,),

                          Row(

                            children: [
                              Text("Subject "),
                              SizedBox(width: 20,),
                              Text("Marks "),

                            ],
                          ),

                          Row(

                            children: [
                              Text("Java "),
                              SizedBox(width: 50,),
                              Text(""+widget.sub1.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Python "),
                              SizedBox(width: 35,),

                              Text(""+widget.sub2.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("C++ "),
                              SizedBox(width: 55,),

                              Text(""+widget.sub3.toString()),
                            ],
                          ),
                       Divider(color: Colors.black,height: 50,thickness: 1,indent: 10,endIndent: 10,),

                        Row(
                          children: [
                            Text("Total",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)),
                            SizedBox(width: 50.0,),
                            Text(""+widget.total.toString()),
                            SizedBox(width: 30.0,),
                            Text("Percen: "+widget.per.toString()),
                            SizedBox(width: 10,),
                            Text("Grade: "+widget.grade.toString()),

                          ],
                        ),


                        ],
                      ),
                    )),
              ),









            ],
          ),
        ),
      ),
    );
  }
}
