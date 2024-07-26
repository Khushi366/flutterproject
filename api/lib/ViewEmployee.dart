import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'EditEmployee.dart';
import 'models/Employee.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  List<Employee>? alldata;
   getdata()async
  {
    Uri url = Uri.parse("https://studiogo.tech/student/studentapi/getEmployee.php");
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      //return json["data"];
      setState(() {
        alldata = json["data"].map<Employee>((obj) => Employee.fromJson(obj)).toList();
      });

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getdata();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (alldata == null)? Center(child: CircularProgressIndicator(),) :(alldata!.length<=0)? Center(child: Text("No data"),) :

      Column(
        children: [
          SizedBox(height: 30.0,),
          Text('Employee List',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),),
          Expanded(
              child: ListView.builder(
                  itemCount: alldata!.length,
                  itemBuilder: (context, index)
                  {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("Employee: "+ alldata![index].ename.toString(),
                                // style: TextStyle(
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 14.0,
                                // ),
                              ),
                              Text("Date:"+ alldata![index].addedDatetime.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),),


                            ],
                          ),
                          SizedBox(height: 8.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Salary: "+ alldata![index].salary.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              Text("Department: "+ alldata![index].department.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              Text("Gender: "+ alldata![index].gender.toString(),style: TextStyle(
                                fontSize: 12.0,
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),

                          Row(
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditEmployee(
                                      //object through update
                                     // obj: alldata![index],

                                      //api through update
                                      id: alldata![index].eid.toString(),
                                    )));
                                  },
                                  child: Icon(Icons.edit_outlined,color: Color(0xFF65819D),size: 20.0,)),
                               GestureDetector(
                                   onTap: (){
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context)
                                         {

                                           return AlertDialog(
                                             title: Text("Delete Message"),
                                             content: Text("Are you sure you want to delete this message?"),

                                             actions: [

                                               TextButton(
                                                 onPressed: () {
                                                   Navigator.of(context).pop();
                                                 },
                                                 child: Text("Cancel"),
                                               ),
                                               TextButton(
                                                 onPressed: ()async{

                                                   var eid = alldata![index].eid.toString();
                                                   log('Deleting  ID: '+eid.toString());

                                                   var params={
                                                     "eid":eid
                                                   };
                                                   
                                                   Uri url = Uri.parse("https://studiogo.tech/student/studentapi/deleteEmployeeNormal.php");
                                                   var response = await http.post(url,body: params);
                                                   if(response.statusCode ==200)
                                                     {
                                                       var json = jsonDecode(response.body.toString());
                                                       if(json["status"]=="true")
                                                         {
                                                           getdata();
                                                           Navigator.of(context).pop();

                                                         }
                                                     }
                                                 },
                                                 child: Text("Delete"),
                                               ),
                                             ],

                                           );
                                         }
                                     );
                                   },
                                   child: Icon(Icons.delete_outline,color: Color(0xFF65819D),size: 20.0,))
                            ],
                          ),

                        ],
                      ),
                    );
                  }

              )
          ),
        ],
      ),
    );
  }
}
