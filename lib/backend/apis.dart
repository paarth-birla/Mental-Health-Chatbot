// ignore_for_file: unused_import, avoid_print
// @dart=2.9
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIS
{
  static Future<dynamic> getResponse(String url, var body) async
  {
    // print('API Call');
    http.Response response = await http.post(Uri.parse(url),
    headers: {
      "Content-Type": "application/json"
    },
    body: jsonEncode(body));
    // body: body);
    // print(jsonEncode(body));
    // print(response.statusCode);
    // print(response.body);
    // return 'Not Failed';
    try {
      if(response.statusCode == 200)
      {
        print('Status code 200');
        String data = response.body;
        // print(data);
        // var decode = jsonDecode(data);
        return data;
      }

      else{
        return 'Failed';
      }
    } catch (e) {
      return 'Failed';
    }
    // print(response.body);
    // return response.body;
  }

  static Future<dynamic> getScore(String url, var body) async
  {
    // print('API Call');
    http.Response response = await http.post(Uri.parse(url),
    headers: {
      "Content-Type": "application/json"
    },
    body: body);
    // body: body);
    // print(jsonEncode(body));
    // print(response.statusCode);
    // print(response.body);
    // return 'Not Failed';
    try {
      if(response.statusCode == 200)
      {
        print('Status code 200');
        String data = response.body;
        // print(data);
        var decode = jsonDecode(data);
        // print(decode);
        return decode;
      }

      else{
        return 'Failed';
      }
    } catch (e) {
      return 'Failed';
    }
    // print(response.body);
    // return response.body;
  }
}