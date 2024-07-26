

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseexample/ViewProductExample.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProductExample extends StatefulWidget {
  const AddProductExample({super.key});

  @override
  State<AddProductExample> createState() => _AddProductExampleState();
}

class _AddProductExampleState extends State<AddProductExample> {


  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  File? myfile;

  var isloading=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (isloading)?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Center(child: Text("Add Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: 20),
                (myfile==null)?Container(
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
                  controller: _name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _qty,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Qty",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Price",
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  width: 200.0,
                  child: ElevatedButton(
                      onPressed: ()  async{
                        setState(() {
                          isloading=true;
                        });

                        var name = _name.text.toString();
                        var qty = _qty.text.toString();
                        var price = _price.text.toString();

                        //Image Upload
                        var uuid = Uuid();
                        var filename = uuid.v1().toString()+".png"; //6c84fb90-12c4-11e1-840d-7b25c5ee775a

                        await FirebaseStorage.instance.ref(filename!).putFile(myfile!).whenComplete((){}).then((filedata) async{
                          await filedata.ref.getDownloadURL().then((fileurl) async{
                            await FirebaseFirestore.instance.collection("products").add({
                              "pname":name,
                              "qty":qty,
                              "price":price,
                              "filename":filename,
                              "fileurl":fileurl
                            }).then((value){
                              _name.text="";
                              _qty.text="";
                              _price.text="";
                              setState(() {
                                myfile=null;
                                isloading=false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Product Inserted!"))
                              );
                            });
                          });
                        });

                     }, child: Text("Add")
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
