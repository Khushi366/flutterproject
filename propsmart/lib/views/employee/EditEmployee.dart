import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/models/Employee.dart';
import 'package:propsmart/providers/EmployeeProvider.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/widgets/MyTextBox.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';
import 'package:provider/provider.dart';

import 'ViewEmployee.dart';

class EditEmployee extends StatefulWidget {
   Employee obj;
   EditEmployee({required this.obj});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  EmployeeProvider? provider;

  var gender="Male";
  var department = "HR";

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  _handleRadio(val)
  {
    setState(() {
      gender=val!;
    });
  }


  // getData()async
  // {
  //   var params = {
  //     "eid":widget.id.toString()
  //   };
  //  await ApiHandler.postRequest(UrlResources.EDIT_SHOW_EMPLOYEE,body: params).then((json){
  //    _name.text = json["data"]["ename"].toString();
  //    _salary.text = json["data"]["salary"].toString();
  //    setState(() {
  //      department = json["data"]["department"].toString();
  //      gender = json["data"]["gender"].toString();
  //    });
  //  });
  //
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);

   // Obj through update

    _name.text = widget.obj.ename.toString();
    _salary.text = widget.obj.salary.toString();
    gender= widget.obj.gender.toString();
    department = widget.obj.department.toString();

    // getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Edit Employee",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            MyTextBox(
              hinttext: "Employee Name",
              keywordType: TextInputType.name,
              controller: _name,
            ),

            SizedBox(height: 20.0,),
            MyTextBox(
              hinttext: "Qty",
              keywordType: TextInputType.number,
              controller: _salary,
            ),

            SizedBox(height: 20.0,),
            Row(
              children: [

                Text("Male"),
                Radio(value: "Male", groupValue: gender,onChanged:_handleRadio),
                Text("Female"),
                Radio(value: "Female", groupValue: gender, onChanged: _handleRadio),
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                DropdownButton(
                  value: department,
                  items: [
                    DropdownMenuItem(child: Text("HR"),value: "HR",),
                    DropdownMenuItem(child: Text("Purchase"),value: "Purchase",),
                    DropdownMenuItem(child: Text("Manager"),value: "Manager",),
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
            SizedBox(height: 20.0,),

            PrimaryButton(
                btntext: "Save",
                btncolor:Color(0xFF294357),
                onclick: ()async{

                  var name = _name.text.toString();
                  var salary = _salary.text.toString();
                  if (name.isEmpty || salary.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill in all fields."),
                        backgroundColor: Colors.black,
                      ),
                    );
                    return;
                  }


                  var params = {

                    "ename": name,
                    "salary": salary,
                    "department": department,
                    "gender":gender,
                    "eid":widget.obj.eid.toString()

                  };

                  await provider!.updateEmployee(params);
                  if(provider!.isupdate==true)
                  {
                    Navigator.of(context).pop();
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error"),
                          backgroundColor: Colors.black,)
                    );
                  }


                  // await ApiHandler.postRequest(UrlResources.EDIT_EMPLOYEE,body: params).then((json){
                  //   if(json["status"]=="true")
                  //   {
                  //     var message = json["message"];
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text(message),backgroundColor: Colors.green,)
                  //     );
                  //     _name.text="";
                  //     _salary.text="";
                  //     setState(() {
                  //       gender="Male";
                  //
                  //     });
                  //     setState(() {
                  //       department="HR";
                  //     });
                  //
                  //     Navigator.of(context).pop();
                  //     Navigator.of(context).pop();
                  //     Navigator.of(context).push(
                  //         MaterialPageRoute(builder: (context)=>ViewEmployee())
                  //     );
                  //
                  //   }
                  //   else
                  //   {
                  //     var message = json["message"];
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text(message),backgroundColor: Colors.red,)
                  //     );
                  //   }
                  // });

              },
            ),
          ],
        ),
      ),
    );
  }
}
