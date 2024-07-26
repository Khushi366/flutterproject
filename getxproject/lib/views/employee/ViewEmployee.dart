import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controllers/EmployeeController.dart';

import 'EditEmployee.dart';

class ViewEmployee extends GetView<EmployeeController>  {
  const ViewEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Employess"),
      ),

      body: Obx((){
        if(controller.isLoading==true)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        else
        {
          return ListView.builder(
            itemCount: controller.employeedata.length,
            itemBuilder: (context,index)
            {
              return Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.purple
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(controller.employeedata![index].ename.toString(),style: TextStyle(color: Colors.white),)),
                        GestureDetector(
                            onTap: (){

                              var eid =controller.employeedata![index].eid.toString();
                              controller.deleteEmployee(eid);
                            },
                            child: Icon(Icons.delete,color: Colors.white,size: 20.0,)),
                        SizedBox(width: 5.0,),
                        GestureDetector(
                            onTap: (){
                              var eid =controller.employeedata![index].eid.toString();
                              controller.getSingleEmployee(eid);
                              Get.to(EditEmployee());


                            },
                            child: Icon(Icons.edit,color: Colors.white,size: 20.0,))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Salary: "+controller.employeedata![index].salary.toString(),style: TextStyle(color: Colors.white),),
                        Text("Dept: "+controller.employeedata![index].department.toString(),style: TextStyle(color: Colors.white),),
                        Text("Gender: "+controller.employeedata![index].gender.toString(),style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

        }

      }),
    );
  }
}
