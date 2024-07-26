import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/models/Employee.dart';
import 'package:propsmart/resources/UrlResources.dart';

class EmployeeProvider extends ChangeNotifier {

  List<Employee>?alldata;
  bool isInsert = false;
  var insertMessage = "";
  var isDelete = false;

  getAllEmployees() async
  {
    try {
      await ApiHandler.getRequest(UrlResources.VIEW_EMPLOYEE).then((json) {
        log(json.toString());
        alldata = json["data"]
            .map<Employee>((obj) => Employee.fromJson(obj))
            .toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex) {
      // log(ex.message.toString());
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
      }
      else {
        //redirect to support page
      }
    }
  }


  insertEmployee(context, params) async
  {
    try {
      await ApiHandler.postRequest(
          UrlResources.ADD_EMPLOYEE, body: params).then((json) {
        if (json["status"] == "true") {
          isInsert = true;
          var message = json["message"];
          insertMessage = message;
        }
        else {
          isInsert = false;
          var message = json["message"];
          insertMessage = message;
        }
      });
    }
    on ErrorHandler catch (ex) {
      // log(ex.message.toString());
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
      }
      else {
        //redirect to support page
      }
    }
  }


  deleteEmployee(context, params) async
  {
    try {
      await ApiHandler.postRequest(UrlResources.DELET_EMPLOYEE, body: params)
          .then((json) {
        if (json["status"] == "true")
        {
          getAllEmployees();
          isDelete = true;
        }
        else
          {
            isDelete = false;
          }
      });
    }
    on ErrorHandler catch (ex) {
      // log(ex.message.toString());
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
      }
      else {
        //redirect to support page
      }
    }
  }


  bool isupdate=false;


  updateEmployee(params) async{
    try {
      await ApiHandler.postRequest(
          UrlResources.EDIT_EMPLOYEE, body: params).then((json) {
        if (json["status"] == "true") {
           getAllEmployees();
          isupdate=true;
        }
        else {
          isupdate=false;
        };
      },
      );
    }
    on ErrorHandler catch (ex)
    {
      // log(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page
      }
      else
      {
        //redirect to support page
      }
    }
  }

}



