import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

Future login(String url, String username, String password) async {
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': basicAuth,
    },
    // body: jsonEncode(<String, String>{
    //   'Username': username,
    //   'Password': password,
    // }),
  );
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}
