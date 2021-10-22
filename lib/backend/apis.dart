import 'dart:convert';
import 'package:http/http.dart' as http;

class APIS
{
  static Future<dynamic> getResponse(String url) async
  {
    http.Response response = await http.get(Uri.parse(url));

    try {
      if(response.statusCode == 200)
      {
        String data = response.body;
        var decode = jsonDecode(data);
        return decode;
      }

      else{
        return 'Failed';
      }
    } catch (e) {
      return 'Failed';
    }
  }
}