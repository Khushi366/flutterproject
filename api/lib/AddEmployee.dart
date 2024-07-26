
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}


class _AddEmployeeState extends State<AddEmployee> {

  var gender="Male";
  var department = "Gujarat";


  TextEditingController _empname = TextEditingController();
  TextEditingController _empsalary = TextEditingController();

  _handleRadio(val)
  {
    setState(() {
      gender=val!;
    });
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Center(child: Text("Add Employee",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),

              SizedBox(height: 20.0,),

              TextField(
                controller: _empname,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _empsalary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Salary",
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Text("Male"),
                  Radio(value: "Male", groupValue: gender,onChanged:_handleRadio),
                  Text("Female"),
                  Radio(value: "Female", groupValue: gender, onChanged: _handleRadio),
                ],
              ),

              Row(
                children: [
                  DropdownButton(
                    value: department,
                    items: [
                      DropdownMenuItem(child: Text("Gujarat"),value: "Gujarat",),
                      DropdownMenuItem(child: Text("Maharstra"),value: "Maharstra",),
                      DropdownMenuItem(child: Text("Punjab"),value: "Punjab",),
                    ],
                    onChanged: (val)
                    {
                      setState(() {
                        department=val!;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                width: 200.0,
                child: ElevatedButton(
                    onPressed: ()async{

                      var enm = _empname.text.toString();
                      var sal = _empsalary.text.toString();

                      var params = {

                        "ename": enm,
                        "salary": sal,
                        "department": department,
                        "gender":gender
                      };

                      Uri url = Uri.parse("https://studiogo.tech/student/studentapi/insertEmployeeNormal.php");
                      var response = await http.post(url,body: params);
                      if(response.statusCode == 200)
                        {
                          var json = jsonDecode(response.body.toString());
                          if(json["status"]=="true")
                            {
                              var message = json["message"];
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(message),backgroundColor: Colors.green,)
                              );
                              _empname.text="";
                              _empsalary.text="";
                              setState(() {
                              gender="Male";

                              });
                              setState(() {
                              department="Gujarat";
                              });

                            }
                          else
                            {
                              var message = json["message"];
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message),backgroundColor: Colors.red,)
                              );
                            }
                        }



                    }, child: Text("Add")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
