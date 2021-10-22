import 'dart:convert';
import 'package:http/http.dart' as http;

class APIS
{
  static Future<dynamic> getResponse(String url, var body) async
  {
    // print('API Call');
    http.Response response = await http.post(Uri.parse(url),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body);

    // print(response.statusCode);
    // print(response);
    // return 'Not Failed';
    // try {
    //   if(response.statusCode == 200)
    //   {
    //     String data = response.body;
    //     print(data);
    //     var decode = jsonDecode(data);
    //     return decode;
    //   }

    //   else{
    //     return 'Failed';
    //   }
    // } catch (e) {
    //   return 'Failed';
    // }
    print(response.body);
    return response.body;
  }
}