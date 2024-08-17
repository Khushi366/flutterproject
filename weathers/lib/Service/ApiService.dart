import 'dart:convert';
import 'package:weathers/helper/ApiHandler.dart';
import 'package:weathers/resources/UrlResources.dart';

class ApiServices {
  static Future<dynamic> weatherData(Map<String, dynamic> params) async {
    String queryParams = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    String url = '${UrlResources.BASE_URL}?$queryParams';
    return await ApiHandler.getRequest(url);
  }
}
