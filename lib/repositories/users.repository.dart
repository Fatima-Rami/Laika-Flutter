import 'dart:convert';

import 'package:meow_too/model/user.model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  late final String token;

  Future<String> login(String email, String password) async {
    final response = await http.post(
        Uri.parse("http://localhost:3000/users/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          "email": email,
          "password": password
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> register(
      String firstname, String lastname, String email, String password) async {
    Map data = {
      'firstName': firstname,
      'lastName': lastname,
      'email': email,
      'password': password
    };
    print("PREPARE RESPONSE JSON *** ");
    String body = jsonEncode(data);
    final response = await http.post(
      Uri.parse("http://192.168.1.17:3000/users/register"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    print("register API suite ");
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
      print(response.body);
      throw Exception('Register failed');
    }
  }
}
