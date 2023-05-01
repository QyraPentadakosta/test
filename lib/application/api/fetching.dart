import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import '../../core/enum/enum_method.dart';
import '../enum/enum_env.dart';
import 'handler_response.dart';
import 'header.dart';

class Fetching {
  Future fetching({
    required EnumMethod method,
    required String url,
    Map<String, dynamic>? data,
  }) async {
    var strLog = "";
    http.Response response;

    String host = dotenv.env[EnumEnv.host.value].toString();
    Map<String, String> headers = await Header().getHeader();

    strLog += "${method.value} $host$url";
    strLog += "\t\n [Request Header]: ${json.encode(headers)}";
    strLog += "\t\n [Request Body]  ${json.encode(data)}";

    developer.log("\n:: PROCESSING ::\n$strLog");

    var start = DateTime.now().millisecondsSinceEpoch;
    try {
      if (method == EnumMethod.post) {
        response = await http.post(
          Uri.parse(host + url),
          body: json.encode(data),
          headers: headers,
        );
      } else if (method == EnumMethod.put) {
        response = await http.put(
          Uri.parse(host + url),
          body: json.encode(data),
          headers: headers,
        );
      } else if (method == EnumMethod.delete) {
        response = await http.delete(
          Uri.parse(host + url),
          body: json.encode(data),
          headers: headers,
        );
      } else if (method == EnumMethod.patch) {
        response = await http.patch(
          Uri.parse(host + url),
          body: json.encode(data),
          headers: headers,
        );
      } else {
        response = await http.get(
          Uri.parse(host + url),
          headers: headers,
        );
      }

      strLog = "";

      strLog += "\t\n [Response Code]: ${response.statusCode} ";
      strLog += "\t\n [Response Header]: ${json.encode(response.headers)}";
      strLog += "\t\n #-----------------#";
      strLog += "\t\n [Response Body]: ${response.body} ";

      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";

      developer.log("\n:: FINALLY ::\n$strLog");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 201) {
        HandlerResponse().successCreate(response.reasonPhrase ?? '');
        return null;
      } else if (response.statusCode == 400) {
        return null;
      } else if (response.statusCode == 401) {
        HandlerResponse().unauthorized(response.reasonPhrase ?? '');
        return null;
      } else if (response.statusCode == 403) {
        return null;
      } else if (response.statusCode == 404) {
        HandlerResponse().notFound(response.reasonPhrase ?? '');
        return null;
      } else if (response.statusCode == 500) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";
      if (kDebugMode) {
        strLog += "ERROR: $e \n";
      }
      return null;
    }
  }
}
