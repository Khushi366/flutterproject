import 'dart:convert';
import 'dart:developer';

import 'package:getxproject/helper/ApiHandler.dart';
import 'package:getxproject/models/Employee.dart';
import 'package:getxproject/models/Product.dart';
import 'package:getxproject/resources/UrlResources.dart';

import '../helper/ErrorHendler.dart';
import 'package:get/get.dart';
class ApiServices
{

  // Product Api Service
  // view Products
  static Future<List<Product>> getAllProducts() async
  {
    var json = await ApiHandler.getRequest(UrlResources.ALL_PRODUCTS);
    return json["data"].map<Product>((obj)=>Product.fromJson(obj)).toList();
  }


  //insert Product
  static Future<bool> insertProduct(params) async
  {
    var json = await ApiHandler.postRequest(UrlResources.ADD_PRODUCT,body: params);
    if(json["status"]=="true")
      {
        var message = json["message"];
        Get.snackbar("Success", message);
        return true;
      }
    else
      {
        var message = json["message"];
        Get.snackbar("Error", message);
        return false;
      }
  }

  //delete Product
  static deleteProduct(params)async
  {
    var json = await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT,body: params);
    if(json["status"]=="true")
    {
      var message = json["message"];
      Get.snackbar("Success", message,snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }
    else
    {
      var message = json["message"];
      Get.snackbar("Error", message,snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }


  //emcode - json to string
  //decode string to json

  //controller to service
  //service to controller
  //controller to views

  static Future<String> showEditProduct(params) async
  {
    var json = await ApiHandler.postRequest(UrlResources.EDIT_SHOW_PRODUCT,body: params);
    return jsonEncode(json);
  }

//Edit Product
  static saveProduct(params) async
  {
    var json = await ApiHandler.postRequest(UrlResources.UPDATE_PRODUCT,body: params);
    if(json["status"]=="true")
    {
      var message = json["message"];
      Get.snackbar("Success", message);
      return true;
    }
    else
    {
      var message = json["message"];
      Get.snackbar("Error", message);
      return false;
    }
  }




//Employee ApiService
// GetEmployee
  static Future<List<Employee>> getAllEmployess() async
  {
    var json = await ApiHandler.getRequest(UrlResources.ALL_EMPLOYEES);
    return json["data"].map<Employee>((obj)=>Employee.fromJson(obj)).toList();
  }


  //Insert Employee
  static Future<bool> insertEmployee(params) async
  {
    var json = await ApiHandler.postRequest(UrlResources.ADD_EMPLOYEES,body: params);
    if(json["status"]=="true")
    {
      var message = json["message"];
      Get.snackbar("Success", message,snackPosition: SnackPosition.BOTTOM);
      return true;
    }
    else
    {
      var message = json["message"];
      Get.snackbar("Error", message);
      return false;
    }
  }


  //delete Employee
  static deleteEmployee(params)async
  {
    var json = await ApiHandler.postRequest(UrlResources.DELETE_EMPLOYEES,body: params);
    if(json["status"]=="true")
    {
      var message = json["message"];
      Get.snackbar("Success", message,snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }
    else
    {
      var message = json["message"];
      Get.snackbar("Error", message,snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  //Show Edit Employee
  static Future<String> showEditEmployees(params) async
  {
    var json = await ApiHandler.postRequest(UrlResources.EDIT_SHOW_EMPLOYEES,body: params);
    return jsonEncode(json);
  }


}