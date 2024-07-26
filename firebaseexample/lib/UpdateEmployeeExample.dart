import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UpdateEmployeeExample extends StatefulWidget {

  var updateeid = "";

  UpdateEmployeeExample({required this.updateeid});

  @override
  State<UpdateEmployeeExample> createState() => _UpdateEmployeeExampleState();
}

class _UpdateEmployeeExampleState extends State<UpdateEmployeeExample> {

  var gender = "Male";
  var department = "Select Product";
  var oldimagename = "";
  var oldimageurl = "";
  var isLoding = true;


  File? myfile;


  TextEditingController _empname = TextEditingController();
  TextEditingController _empsalary = TextEditingController();


  _handelRadio(val) {
    setState(() {
      gender = val!;
    });
  }

  getData()async
  {
    setState(() {
      isLoding = true;
    });
    await FirebaseFirestore.instance.collection("employee").doc(widget.updateeid).get().then((document) {

      _empname.text = document["empname"].toString();
      _empsalary.text = document["empsalary"].toString();
      setState(() {

        gender = document["empgender"].toString();
        department = document["department"].toString();

        oldimagename = document["filename"].toString();
        oldimageurl = document["fileurl"].toString();

      });
      setState(() {
        isLoding =  false;
      });

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  (isLoding)?Center(
          child: CircularProgressIndicator(),
        ):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Center(child: Text("Edit Employee", style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),)),

                SizedBox(height: 20.0,),

                (myfile==null)?(oldimagename!="")?Image.network(oldimageurl,):Container(
                  width: 200,
                  height: 150,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC0C0C0).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                        BoxShadow(
                          color: Color(0xFFC0C0C0).withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(-2, -2),
                        ),
                      ]
                  ),
                ):Image.file(myfile!,width: 100.0,),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(source: ImageSource.camera,imageQuality: 50);

                          setState(() {
                            myfile = File(image!.path);
                          });

                        }, child: Text("Camera")),
                    ElevatedButton(
                        onPressed: () async{
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50);

                          setState(() {
                            myfile = File(image!.path);
                          });

                        }, child: Text("Gallery")),
                  ],
                ),

                SizedBox(height: 20),

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
                    Radio(
                        value: "Male",
                        groupValue: gender,
                        onChanged: _handelRadio),
                    Text("Male"),

                    Radio(
                        value: "Female",
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
                      onPressed: () async{

                        setState(() {
                          isLoding = true;
                        });

                        var name = _empname.text.toString();
                        var salary  = _empsalary.text.toString();
                        var genders = gender;
                        var departments = department;


                        if (myfile == null) {
                          await FirebaseFirestore.instance.collection("employee").doc(widget.updateeid).update({
                            "empname": name,
                            "empsalary": salary,
                            "empgender": genders,
                            "department": departments,
                          }).then((value) {
                            setState(() {
                              isLoding = false;
                            });
                            Navigator.of(context).pop();
                          });
                        }
                        else
                        {
                          await FirebaseStorage.instance.ref("employee/"+oldimagename).delete().then((value)async{
                            var uuid = Uuid();//unique record show
                            var filename  = uuid.v1().toString();
                            await FirebaseStorage.instance.ref("employee/"+filename!).putFile(myfile!).whenComplete(() {}).then((filedata)async {
                              await filedata.ref.getDownloadURL().then((fileurl) async {

                                await FirebaseFirestore.instance.collection("employee").doc(widget.updateeid).update({
                                  "empname": name,
                                  "empsalary": salary,
                                  "empgender": genders,
                                  "department": departments,
                                  "filename":filename,
                                  "fileurl":fileurl
                                }).then((value) {
                                  setState(() {
                                    isLoding = false;
                                  });
                                  Navigator.of(context).pop();
                                });


                              });
                            });
                          });
                        }
                      }, child: Text("Save")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
