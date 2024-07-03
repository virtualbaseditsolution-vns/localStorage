
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/helpers.dart';
import '../../utils/local_storage.dart';
import 'app_exceptions.dart';
export 'base_controller.dart';

class CallApi {
  static const int timeOutDuration = 30;
  static const double apiVersion = 1.0;

  //GET
  static Future<dynamic> get(String baseUrl, String api) async {
    int attempts = 3;
    dynamic res;
    var token = await AppStorage.readData("token");
    var uri = Uri.parse(baseUrl + api);
    if (kDebugMode) {
      print(uri);
    }
    var headers = {'Authorization': 'Bearer $token', 'api': token.toString()};
    for(int i=0; i<attempts; i++){
      try {
        var response = await http
            .get(uri, headers: headers)
            .timeout(const Duration(seconds: timeOutDuration));
        res=_processResponse(response);
        break;
      } on SocketException {
        throw FetchDataException("No Internet Connection", uri.toString());
      } on TimeoutException {
        throw ApiNotResponseException(
            "Api not responded in time", uri.toString());
      }
    }
    return res;
  }



  static dynamic _processResponse(http.Response response) {
    debugPrint(response.body.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson;
        try {
          responseJson = jsonDecode(response.body);
        }on FormatException catch (e){
          responseJson = response.body;
        }
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 412:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 503:
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException(
            "Error occurred with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }

  static dynamic _processResponseNew(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson;
        try {
          responseJson = jsonDecode(response.body);
        }on FormatException catch (e){
          responseJson = response.body;
        }
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 412:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 503:
        throw ApiNotResponseException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException(
            "Error occurred with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
