import 'package:flutter/material.dart';
import 'package:sqfliteexample/ViewEmployeeExample.dart';

import 'helper/DatabaseHelper.dart';

class UpdateEmployeeExample extends StatefulWidget {

  var updateeid = "";
  UpdateEmployeeExample({required this.updateeid});

  @override
  State<UpdateEmployeeExample> createState() => _UpdateEmployeeExampleState();
}

class _UpdateEmployeeExampleState extends State<UpdateEmployeeExample> {

    var gender = "M";
    var department = "Select Product";

    TextEditingController _empname = TextEditingController();
    TextEditingController _empsalary = TextEditingController();


    _handelRadio(val) {
      setState(() {
        gender = val!;
      });
    }


    getData()async
    {
      DatabaseHelper obj = new DatabaseHelper();
      var data =  await obj.getSingleEmployee(widget.updateeid);

      setState(() {
        _empname.text = data[0]["name"].toString();
        _empsalary.text = data[0]["salary"].toString();
         gender = data[0]["gender"].toString();
         department = data[0]["department"].toString();

      });

    }

    @override
    void initState(){
      super.initState();
      getData();
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
                Center(child: Text("Edit Employee", style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),)),

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
                    Text("Gender: "),
                    Radio(value: "M",
                        groupValue: gender,
                        onChanged: _handelRadio),
                    Text("Male"),

                    Radio(value: "F",
                        groupValue: gender,
                        onChanged: _handelRadio),
                    Text("Female"),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      DropdownButton(
                        value: department,
                        items: [
                          DropdownMenuItem(child: Text("Select Product"),
                            value: "Select Product",),
                          DropdownMenuItem(child: Text("Human Resources"),
                            value: "Human Resources",),
                          DropdownMenuItem(child: Text("Finance"),
                            value: "Finance",),
                          DropdownMenuItem(child: Text("Marketing"),
                            value: "Marketing",),
                        ],


                        onChanged: (val) {
                          setState(() {
                            department = val!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  width: 200.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        var empName = _empname.text.toString();
                        var empSalary = _empsalary.text.toString();
                        var empGender = gender;
                        var empDepartment = department;

                        DatabaseHelper obj = new DatabaseHelper();

                        var status = await obj.updateEmployee(empName, empSalary, empGender, empDepartment, widget.updateeid);
                        if(status == 1){
                          Navigator.of(context).pop();//edit
                          Navigator.of(context).pop();//view
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>ViewEmployeeExample())
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error!"))
                          );
                        }

                      }, child: Text("Edit")
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
