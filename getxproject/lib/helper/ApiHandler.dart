import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import 'ErrorHendler.dart';

class ApiHandler {

  //ADD, Delete
  static Future<dynamic> postRequest (url,{Map<String,String>? headers, body, encoding}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.post(
          uri, headers: headers, body: body, encoding: encoding);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode, message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format", code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure", code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem", code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(
          message: ex.toString().replaceAll("Exception: ", ""), code: 500);
    }
  }

  //View
  static Future<dynamic> getRequest(url, {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse JSON and return it
      } else {
        throw ErrorHandler(code: response.statusCode,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format", code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure", code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem", code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""), code: 500);
    }
  }

}

