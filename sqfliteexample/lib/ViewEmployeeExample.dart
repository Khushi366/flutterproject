import 'package:flutter/material.dart';
import 'package:sqfliteexample/DrawerExample.dart';

import 'UpdateEmployeeExample.dart';
import 'helper/DatabaseHelper.dart';

class ViewEmployeeExample extends StatefulWidget {
  const ViewEmployeeExample({super.key});

  @override
  State<ViewEmployeeExample> createState() => _ViewEmployeeExampleState();
}

class _ViewEmployeeExampleState extends State<ViewEmployeeExample> {

  Future<List>? alldata;

  Future<List>getdata()async{
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.allEmployee();
    return data;
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      alldata = getdata();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerExample(),
      body: FutureBuilder(
        future: alldata,
        builder: (index,snapshot){
          if(snapshot.hasData)
          {
            if(snapshot.data!.length<=0)
            {
              return Center(
                child: Text("No Product Found!"),
              );
            }
            else{

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index)

                  {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      color: Colors.red.shade200,
                      child: Column(
                        children: [
                          Text("Employee Name : "+ snapshot.data![index]["name"].toString()),
                          Text("Employee Salary : "+ snapshot.data![index]["salary"].toString()),
                         // Text("Employee Gender : "+ snapshot.data![index]["gender"].toString()),
                          Text("Employee Gender : ${snapshot.data![index]["gender"] == "M" ? "Male" : "Female"}"),

                          Text("Employee Department : "+ snapshot.data![index]["department"].toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: ()async{

                                    var eid  = snapshot.data![index]["eid"].toString();
                                    DatabaseHelper obj = new DatabaseHelper();
                                    var status = await obj.deleteEmployee(eid);
                                    if(status == 1)
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("employee deleted"))
                                        );
                                        setState(() {
                                          alldata = getdata();
                                        });
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("employee not deleted"))
                                        );
                                      }
                                  }, child: Text("Delete"),
                              ),

                              SizedBox(width: 15.0,),

                              ElevatedButton(onPressed: (){

                                var eid  = snapshot.data![index]["eid"].toString();

                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateEmployeeExample(
                                  updateeid: eid,
                                )));

                              }, child: Text("Edit"))
                            ],
                          )
                        ],
                      ),
                    );
                  }
              );
            }
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );

  }
}
