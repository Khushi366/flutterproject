import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/models/Employee.dart';
import 'package:getxproject/services/ApiServices.dart';
import 'package:getxproject/views/employee/ViewEmployee.dart';

class EmployeeController extends GetxController
{
  var isLoading = true.obs;
  var employeedata = <Employee>[].obs;

  TextEditingController ename = TextEditingController();
  TextEditingController esalary = TextEditingController();


  var selectDepartment = "".obs;
  var department = ["HR","IT","Marketing","Sales"].obs;


  var selectGender = "".obs;
  var genders = ["Male", "Female"].obs;


  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }


  //view Employees
  fetchEmployees() async
  {
    try
    {
      isLoading(true);
      var allproducts = await ApiServices.getAllEmployess();
      log(allproducts.toString());
      employeedata.assignAll(allproducts);
    }
    finally
    {
      isLoading(false);
    }
  }

  //Add Employee
  //add product
  addEmployee() async
  {
    try
    {
      isLoading(true);
      var params = {
        "ename":ename.text.toString(),
        "salary":esalary.text.toString(),
        "department":selectDepartment.value,
        "gender":selectGender.value,
      };
      var result = await ApiServices.insertEmployee(params);
      if(result==true)
      {
        ename.text="";
        esalary.text="";
        selectDepartment.value ="";
        selectGender.value = "";
        await fetchEmployees();
        Get.off(ViewEmployee());
      }
    }
    finally
    {
      isLoading(false);
    }
  }


  //deleteEmployee
  deleteEmployee(String eid)async
  {
    try
    {
      var params ={
        "eid":eid,
      };
      var result = await ApiServices.deleteEmployee(params);
      if (result == true) {
        await fetchEmployees();
      }
    }
    finally{
      isLoading(false);

    }
  }


  //Edit Show Product
  var updateid = "";
  getSingleEmployee(eid) async
  {
    try
    {
      var params ={
        "eid":eid,
      };
      var data = await ApiServices.showEditEmployees(params);
      var json = jsonDecode(data.toString());
      Employee obj = Employee.fromJson(json["data"]);
      ename.text = obj.ename.toString();
      esalary.text = obj.salary.toString();
      selectDepartment.value = obj.department.toString();
      selectGender.value = obj.gender.toString();
      updateid = obj.eid.toString();
    }
    finally{
      isLoading(false);
    }
  }
}