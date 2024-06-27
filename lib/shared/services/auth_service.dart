import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:movil/shared/model/user_model.dart';

class AuthService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  final String baseUrl =
      'https://backend-production-6ed3.up.railway.app/api/pet-health/v1';

  Future<void> login(String email, String password) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final url = '$baseUrl/login';

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

      _user = User.fromJson(responseData['user']);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(String name, String lastname, String email,
      String password, String address, String phone) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final url = '$baseUrl/signup';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': name,
          'lastname': lastname,
          'email': email,
          'password': hashedPassword,
          'address': address,
          'phone': phone,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw Exception(responseData['error']);
      }

      _user = User.fromJson(responseData['user']);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
