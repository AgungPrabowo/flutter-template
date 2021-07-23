import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../shared.dart';

class Network {
  static Future<String> getRequest({String path = ""}) async {
    String result = "";

    // print("### Base Url: ${Keys.BASE_API_URL + path}");

    try {
      final response = await http
          .get(Uri.parse(Keys.BASE_API_URL + path))
          .timeout(Duration(minutes: 3));
      // print("### Response: ${response.body}");
      result = response.body;
    } catch (e) {
      print('### Error: $e');
    }
    return result;
  }

  static Future<String> postRequest(
      {String path = "", Map<String, dynamic>? body}) async {
    String result = "";

    // print("### Base Url: ${Keys.BASE_API_URL + path}");

    try {
      final response = await http.post(Uri.parse(Keys.BASE_API_URL + path),
          body: json.encode(body),
          headers: {
            "Content-Type": "application/json"
          }).timeout(Duration(minutes: 3));
      // print("### Response: ${response.body}");
      result = response.body;
    } catch (e) {
      print('### Error: $e');
    }
    return result;
  }
}
