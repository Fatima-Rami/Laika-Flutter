import 'dart:convert';

import 'package:meow_too/model/user.model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  late final String token;

  Future<void> login(String email, String password) async {
    var response = await http.post(
        Uri.parse("http://localhost:3000/users/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          "email": email,
          "password": password
        });

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> register(
      String firstname, String lastname, String email, String password) async {
    Map data = {
      'firstName': firstname,
      'lastName': lastname,
      'email': email,
      'password': password
    };

    String body = jsonEncode(data);
    final response = await http.post(
      Uri.parse("http://192.168.1.17:3000/users/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      print("############# http post ################");
      print(response.body);
    } else {
      print(response.statusCode.toString());
      print(response.body);
      throw Exception('Register failed');
    }
  }
}
