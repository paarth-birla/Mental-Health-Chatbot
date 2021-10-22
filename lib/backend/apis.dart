import 'dart:convert';
import 'package:http/http.dart' as http;

class APIS
{
  static Future<dynamic> getResponse(String url, var body) async
  {
    http.Response response = await http.post(Uri.parse(url),
    body: body);

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