import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controllers/EmployeeController.dart';

class AddEmployee extends GetView<EmployeeController> {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    controller.ename.text = "";
    controller.esalary.text = "";
    controller.selectDepartment.value="";
    controller.selectGender.value = "";

    // genders = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
               controller: controller.ename,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),

                ),
              ),

              SizedBox(height: 20.0,),

              TextField(
                controller: controller.esalary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Salary",
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),

              Obx((){
                return DropdownButton(
                  value: controller.selectDepartment.value.isNotEmpty
                      ? controller.selectDepartment.value
                      : null,
                  hint: Text('Select Department'),
                  items: controller.department.map((department) {
                    return DropdownMenuItem(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      controller.selectDepartment.value = newValue;
                    }
                  },

                );
              }),

              Obx((){
                return Row(
                  children: [
                    Radio(
                        value: "Male",
                        groupValue: controller.selectGender.value,
                        onChanged: (value)
                        {
                          controller.selectGender.value = value!;

                        }
                    ),
                    Text("Male"),
                    Radio(
                        value: "Female",
                        groupValue: controller.selectGender.value,
                        onChanged: (value)
                        {
                          controller.selectGender.value = value!;

                        }
                    ),
                    Text("Female"),
                  ],
                );
              }),


              SizedBox(height: 20.0,),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                    onPressed: () async{
                      await controller.addEmployee();
                    }, child: Text("Add")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
