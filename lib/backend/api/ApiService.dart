import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleapp/backend/models/LoginModel.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String? username = loginRequestModel.username;
    String? password = loginRequestModel.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(
      loginRequestModel.url,
      body: loginRequestModel.toJson(),
      headers: <String, String>{
        'authorization': basicAuth,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data!');
    }
  }
}
