import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UpdateProductExample extends StatefulWidget {

  
  var updateid="";

   UpdateProductExample({required this.updateid});


  @override
  State<UpdateProductExample> createState() => _UpdateProductExampleState();
}

class _UpdateProductExampleState extends State<UpdateProductExample> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();


  var oldimagename="";
  var oldimageurl="";
  
  getdata() async
  {
    setState(() {
      isloading=true;
    });
    await FirebaseFirestore.instance.collection("products").doc(widget.updateid).get().then((document){
      _name.text = document["pname"].toString();
      _qty.text = document["qty"].toString();
      _price.text = document["price"].toString();
      setState(() {
        oldimagename = document["filename"].toString();
        oldimageurl = document["fileurl"].toString();
      });
      setState(() {
        isloading=false;
      });
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  File? myfile;

  var isloading=false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (isloading)?Center(child: CircularProgressIndicator(),):Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              Center(child: Text("Edit Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
              SizedBox(height: 20),

              (myfile==null)?(oldimageurl!="")?Image.network(oldimageurl,width: 100.0,):Container(
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


                      if(myfile==null)
                        {
                          await FirebaseFirestore.instance.collection("products").doc(widget.updateid).update({
                            "pname":name,
                            "qty":qty,
                            "price":price,
                          }).then((value){
                            setState(() {
                              isloading=false;
                            });
                            Navigator.of(context).pop();
                          });
                        }
                      else
                        {
                          await FirebaseStorage.instance.ref(oldimagename).delete().then((value) async{
                            var uuid = Uuid();
                            var filename = uuid.v1().toString()+".png";
                            await FirebaseStorage.instance.ref(filename!).putFile(myfile!).whenComplete((){}).then((filedata) async{
                              await filedata.ref.getDownloadURL().then((fileurl) async{
                                await FirebaseFirestore.instance.collection("products").doc(widget.updateid).update({
                                  "pname":name,
                                  "qty":qty,
                                  "price":price,
                                  "filename":filename,
                                  "fileurl":fileurl
                                }).then((value){
                                  setState(() {
                                    isloading=false;
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
    );
  }
}
