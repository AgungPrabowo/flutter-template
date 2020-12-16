import 'dart:async';
import 'package:http/http.dart' as http;

import '../shared.dart';

class Network {
  static Future<String> getRequest({String path = ""}) async {
    String result = "";

    // print("### Base Url: ${KeysGambling.BASE_URL + path}");

    try {
      final response = await http
          .get(KeysGambling.BASE_API_URL + path)
          .timeout(Duration(minutes: 3));
      // print("### Response: ${response.body}");
      result = response.body;
    } catch (e) {
      print('### Error: ${e.message}');
    }
    return result;
  }
  static Future<String> postRequest({String path = "", Map<String, dynamic> body}) async {
    String result = "";

    // print("### Base Url: ${KeysGambling.BASE_URL + path}");

    try {
      final response = await http
          .post(KeysGambling.BASE_API_URL + path, body: body)
          .timeout(Duration(minutes: 3));
      // print("### Response: ${response.body}");
      result = response.body;
    } catch (e) {
      print('### Error: ${e.message}');
    }
    return result;
  }
}