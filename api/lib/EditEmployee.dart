import 'dart:convert';

import 'package:api/ViewEmployee.dart';
import 'package:flutter/material.dart';

import 'models/Employee.dart';
import 'package:http/http.dart'as http;

class EditEmployee extends StatefulWidget {
  //Obj through update
  //  Employee obj;
  //  EditEmployee({required this.obj});

  // api through update
  var id;
  EditEmployee({required this.id});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {

  getdata() async{
    Uri url = Uri.parse("https://studiogo.tech/student/studentapi/getSingleEmployee.php");
    var params = {
      "eid":widget.id.toString()
    };
    var response = await http.post(url,body: params);
    if(response.statusCode==200)
    {
      var json = jsonDecode(response.body.toString());
      _empname.text = json["data"]["ename"].toString();
      _empsalary.text = json["data"]["salary"].toString();
      setState(() {
       state = json["data"]["department"].toString();
       gender = json["data"]["gender"].toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Obj through update
    // _empname.text = widget.obj.ename.toString();
    // _empsalary.text = widget.obj.salary.toString();
    // gender= widget.obj.gender.toString();
    // state= widget.obj.department.toString();


    // api through update
    getdata();

  }

  @override

  var gender="Male";
  var state = "Gujarat";


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
              Center(child: Text("Edit Employee",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),

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
                    value: state,
                    items: [
                      DropdownMenuItem(child: Text("Gujarat"),value: "Gujarat",),
                      DropdownMenuItem(child: Text("Maharstra"),value: "Maharstra",),
                      DropdownMenuItem(child: Text("Punjab"),value: "Punjab",),
                    ],
                    onChanged: (val)
                    {
                      setState(() {
                        state=val!;
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
                        "department": state,
                        "gender":gender,
                        "eid":widget.id.toString()

                      };

                      Uri url = Uri.parse("https://studiogo.tech/student/studentapi/updateEmployeeNormal.php");
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
                            state="Gujarat";
                          });

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>ViewEmployee())
                          );

                        }
                        else
                        {
                          var message = json["message"];
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message),backgroundColor: Colors.red,)
                          );
                        }
                      }





                    }, child: Text("Save")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
