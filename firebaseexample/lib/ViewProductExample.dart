import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'UpdateProductExample.dart';

class ViewProductExample extends StatefulWidget {
  const ViewProductExample({super.key});

  @override
  State<ViewProductExample> createState() => _ViewProductExampleState();
}

class _ViewProductExampleState extends State<ViewProductExample> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerExample(),
        body: Column(
          children: [
            SizedBox(height: 30.0,),
            Center(child: Text("View Product",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
                {
                  if(snapshot.hasData)
                    {
                      if(snapshot.data!.size<=0)
                        {
                          return Center(child: Text("No Products found!"),);
                        }
                      else
                        {
                          return ListView(
                            children: snapshot.data!.docs.map((document){
                              return Container(
                                width: double.infinity,

                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC0C0C0).withOpacity(
                                            0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2, 2),
                                      ),
                                      BoxShadow(
                                        color: Color(0xFFC0C0C0).withOpacity(
                                            0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(-2, -2),
                                      ),
                                    ]
                                ),

                                child: Column(
                                  children: [
                                    Image.network(document["fileurl"].toString(),width: 100.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Name: "+document["pname"].toString()),
                                        Text("Qty: "+document["qty"].toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Rs." + document["price"].toString()),
                                      ],
                                    ),
                                     Row(
                                      children: [
                                        GestureDetector(
                                            onTap: ()async{
                                            var id = document.id.toString();
                                            var filename = document["filename"].toString();

                                            await FirebaseStorage.instance.ref(filename).delete().then((value) async{
                                              await FirebaseFirestore.instance.collection("products").doc(id).delete().then((value){
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text("Products deleted!"))
                                                );
                                              });
                                            });

                                            },
                                            child: Icon(Icons.delete)),
                                        GestureDetector(
                                            onTap: (){
                                              var id = document.id.toString();
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateProductExample(
                                                updateid: id,
                                              )));

                                            },
                                            child: Icon(Icons.edit)),
                                      ],
                                    )
                                  ],
                                ),
                              );
                              // return ListTile(
                              //   title: Text(document["pname"].toString()),
                              //   subtitle: Text(document["qty"].toString()),
                              //   trailing: Text("Rs." + document["price"].toString()),
                              //   onTap: () async{
                              //     var id = document.id.toString();
                              //     await FirebaseFirestore.instance.collection("products").doc(id).delete().then((value){
                              //
                              //     });
                              //   },
                              // );
                            }).toList(),
                          );
                        }
                    }
                  else
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                },
              ),
            ),
          ],
        )
    );
  }
}
