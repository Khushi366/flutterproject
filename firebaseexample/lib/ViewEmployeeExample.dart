import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'UpdateEmployeeExample.dart';

class ViewEmployeeExample extends StatefulWidget {
  const ViewEmployeeExample({super.key});

  @override
  State<ViewEmployeeExample> createState() => _ViewEmployeeExampleState();
}

class _ViewEmployeeExampleState extends State<ViewEmployeeExample> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerExample(),
        body: Column(
          children: [
            SizedBox(height: 30.0,),
            Center(child: Text("View Employee",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
               stream: FirebaseFirestore.instance.collection("employee").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){

                 if(snapshot.hasData)
                   {

                     if(snapshot.data!.size<=0)
                       {
                         return Center(child: Text("No employee found!"),);
                       }
                     else
                       {
                         return ListView(
                           children: snapshot.data!.docs.map((document) {
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
                                       Text("Name: "+document["empname"].toString()),
                                       Text("Salary: "+document["empsalary"].toString()),
                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Gender: "+document["empgender"].toString()),
                                       Text("Department: "+document["department"].toString()),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       GestureDetector(
                                           onTap: ()async{
                                             var id = document.id.toString();
                                           //  log(id);

                                             var filename = document["filename"].toString();
                                             await FirebaseStorage.instance.ref(filename).delete().then((value)async{
                                               await FirebaseFirestore.instance.collection("employee").doc(id).delete().then((value){
                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                     SnackBar(content: Text("Employees deleted!"))
                                                 );
                                               });
                                             });
                                           },
                                           child: Icon(Icons.delete)),
                                       GestureDetector(
                                           onTap: (){
                                             var id = document.id.toString();
                                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdateEmployeeExample(updateeid: id,)));
                                           },
                                           child: Icon(Icons.edit)),
                                     ],
                                   )
                                 ],
                               ),

                             );
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
        ),
    );
  }
}
