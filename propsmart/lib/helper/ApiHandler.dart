import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'ErrorHandler.dart';

class ApiHandler {

  static Future<dynamic> postRequest (url,{Map<String,String>? headers, body, encoding}) async {

    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.post(uri, headers: headers, body: body, encoding: encoding);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }

  static Future<dynamic> postLogin (url,{Map<String,String>? headers, body, encoding}) async {

    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.post(uri, headers: headers, body: body, encoding: encoding);
      return response;
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }


  static Future<dynamic> getProfile(url, {Map<String, String>? headers}) async {
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

  static Future<dynamic> postRefreshToken(String url, {Map<String, String>? headers, body, encoding}) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.post(uri, headers: headers, body: body, encoding: encoding);
      return response;
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

  static Future<dynamic> getRequest (String url) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode ,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }
}