import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/views/utility/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CheckLoginProvider extends ChangeNotifier {
  bool islogin = false;

  checkLogin(context, params) async
  {
    try {

      await ApiHandler.postLogin(UrlResources.LOGIN, body: params).then((response) async {

        if(response.statusCode.toString()=="200")
          {
            var json = jsonDecode(response.body.toString());
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("islogin","yes");
            prefs.setString("firstName",json["firstName"]);
            prefs.setString("token",json["token"].toString());
            prefs.setString("refreshToken",json["refreshToken"].toString());

            islogin=true;
          }
        else
          {
            islogin=false;
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
}