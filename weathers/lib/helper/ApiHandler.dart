import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'ErrorHandler.dart';

class ApiHandler {
  static Future<dynamic> postRequest(String url, {
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    Uri uri = Uri.parse(url);
    try {
      log('Sending POST request to: $uri');
      log('Request body: $body');
      http.Response response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: body,
          encoding: encoding);
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode, message: response.body);
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

  static Future<dynamic> getRequest(String url) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
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
}



