import 'dart:convert';

import 'package:http/http.dart' as http;
import 'config.dart';

class ServiceApis {
  ServiceApis._();

  static Map decodedResponse(http.Response responseResult) =>
      jsonDecode(responseResult.body) as Map;

  static Future<Map?> test() async {
    var client = http.Client();
    try {
      var response = await client.get(ServiceConfig.testAPIUri);
      return decodedResponse(response);
    } catch (e) {
      print('HTTP Response error : $e');
      return null;
    }
  }

  static Future<Map?> users() async {
    var client = http.Client();
    try {
      var response = await client.get(ServiceConfig.usersAPIUri);
      return decodedResponse(response);
    } catch (e) {
      print('HTTP Response error : $e');
      return null;
    }
  }

  static Future<bool> login(String username, String password) async {
    var client = http.Client();
    try {
      var response = await client.post(ServiceConfig.loginAPIUri,
          body: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print('HTTP Response error : $e');
      return false;
    }
  }
}
