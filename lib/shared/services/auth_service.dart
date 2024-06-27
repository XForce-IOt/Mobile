import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService with ChangeNotifier {
  String? _token;
  String? _userId;

  bool get isAuth {
    return _token != null;
  }

  Future<void> login(String email, String password) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final url = '${dotenv.env['BASE_URL']}/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': hashedPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw Exception(responseData['error']);
      }

      _token = responseData['token'];
      _userId = responseData['userId'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(
      String name, String lastName, String email, String password) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final url = '${dotenv.env['BASE_URL']}/signup';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': name,
          'lastName': lastName,
          'email': email,
          'password': hashedPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw Exception(responseData['error']);
      }
    } catch (error) {
      rethrow;
    }
  }
}
