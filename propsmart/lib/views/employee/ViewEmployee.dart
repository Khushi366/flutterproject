import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/models/Employee.dart';
import 'package:propsmart/providers/EmployeeProvider.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:provider/provider.dart';

import 'EditEmployee.dart';
import 'ViewEmployee2.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  // List<Employee>?alldata;
  // getdata()async
  // {
  //   try
  //   {
  //     await ApiHandler.getRequest(UrlResources.VIEW_EMPLOYEE).then((json){
  //       log(json.toString());
  //       setState(() {
  //         alldata = json["data"].map<Employee>((obj)=>Employee.fromJson(obj)).toList();
  //       });
  //     });
  //   }
  //   on ErrorHandler catch (ex)
  //   {
  //     // log(ex.message.toString());
  //     if(ex.message.toString()=="Internet Connection Failure")
  //     {
  //       //rdirect to no internet page
  //     }
  //     else
  //     {
  //       //redirect to support page
  //     }
  //   }
  // }

  EmployeeProvider? provider;
  getdata()async
  {
    await provider!.getAllEmployees();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("View Employess",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ViewEmployee2())
            );
          }, icon: Icon(Icons.access_time_filled))
        ],
      ),
      body:(provider!.alldata == null)?Center(child: CircularProgressIndicator(color:Color(0xFF233645)),)
          :(provider!.alldata!.length <=0)
          ? Center(child: Text("No data"),)
          : ListView.builder(
          itemCount: provider!.alldata!.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4).withOpacity(0.4),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(""+provider!.alldata![index].ename.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditEmployee(
                                 // id:provider!.alldata![index].eid.toString()
                                  obj: provider!.alldata![index],

                              )));
                            },
                            child: Icon(Icons.edit_outlined,color: Color(0xFF233645),size: 20.0,)),
                        GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext contex)
                                  {
                                    return AlertDialog(
                                      title: Text("Delete Message",style: TextStyle(color: Color(0xFF233645),),),
                                      content: Text("Are you sure you want to delete this message?",style: TextStyle(color: Color(0xFF233645),),),

                                      backgroundColor: Colors.white,
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold),),
                                        ),
                                        TextButton(
                                          onPressed: ()async{
                                            var eid = provider!.alldata![index].eid.toString();
                                            var params = {
                                              "eid": eid
                                            };

                                            await provider!.deleteEmployee(context, params);
                                            if(provider!.isDelete == true)
                                              {
                                                Navigator.of(context).pop();
                                              }
                                            // var pid = alldata![index].pid.toString();
                                            // var params = {
                                            //   "pid": pid
                                            // };
                                            // Uri url = Uri.parse("https://studiogo.tech/student/studentapi/deleteProductNormal.php");
                                            //
                                            // var response = await http.post(url,body: params);
                                            // if(response.statusCode == 200)
                                            //   {
                                            //     var json  = jsonDecode(response.body.toString());
                                            //     if(json["status"]=="true")
                                            //     {
                                            //       getdata();
                                            //       Navigator.of(context).pop();
                                            //     }
                                            //
                                            //   }
                                          },
                                          child: Text("Delete",style: TextStyle(color: Color(0xFF233645),fontWeight: FontWeight.bold),),
                                        ),

                                      ],
                                    );
                                  }
                              );
                            },
                            child: Icon(Icons.delete_outline,color: Color(0xFF233645),size: 20.0,))
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Salary: "+provider!.alldata![index].salary.toString(),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 20.0,),
                    Row(
                      children: [
                        Text("Gender: "+provider!.alldata![index].gender.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 20.0,),

                        Text("Depart: "+provider!.alldata![index].department.toString(),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 20.0,),

                        Text("Date: "+provider!.alldata![index].addedDatetime.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                )

            );

          }),
    );
  }
}
