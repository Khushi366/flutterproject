import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';

import '../helper/ErrorHandler.dart';
import '../models/Product.dart';
import '../resources/UrlResources.dart';

class ProductProvider extends ChangeNotifier
{

  List<Product>? alldata;


  getAllProducts() async
  {
    try
    {
      await ApiHandler.getRequest(UrlResources.VIEW_PRODUCT).then((json){
        log(json.toString());
        alldata = json["data"].map<Product>((obj)=>Product.fromJson(obj)).toList();
        notifyListeners();
      });
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


  bool isinsert=false;
  var insertmessage="";

  insertProduct(context,params) async
  {
    try {
      await ApiHandler.postRequest(UrlResources.ADD_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isinsert=true;
          var message = json["message"];
          insertmessage=message;
        }
        else {
          isinsert=false;
          var message = json["message"];
          insertmessage=message;
        }
      });
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

  var isdelete=false;

  deleteProduct(context,params) async
  {
    try {
      await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT,body:params).then((json){
        if(json["status"]=="true")
        {
          getAllProducts();
          isdelete=true;
        }
        else
          {
            isdelete=false;
          }
      });
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


  Product? singleobj;
  getsingleproduct(params) async{
    try {
      await ApiHandler.postRequest(UrlResources.UPDATE_SHOW_PRODUCT,body: params).then((json){
        singleobj = Product.fromJson(json["data"]);
      });
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


  bool isupdate=false;


  updateProduct(params) async{
    try {
      await ApiHandler.postRequest(
          UrlResources.UPDATE_PRODUCT, body: params).then((json) {
        if (json["status"] == "true") {
          getAllProducts();
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