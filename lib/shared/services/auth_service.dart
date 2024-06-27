// ignore_for_file: avoid_print

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
      print('Login URL: $url'); // Log de la URL
      print('Login Request Body: ${json.encode({
            'email': email,
            'password': hashedPassword,
          })}'); // Log del cuerpo de la solicitud

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': hashedPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print(
          'Login Response Status: ${response.statusCode}'); // Log del estado de la respuesta
      print(
          'Login Response Body: ${response.body}'); // Log del cuerpo de la respuesta

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _user = User.fromJson(responseData['user']);
        notifyListeners();
      } else {
        final responseData = json.decode(response.body);
        throw HttpException(responseData['error'] ?? 'Error desconocido');
      }
    } catch (error) {
      print('Login error: $error'); // Imprimir el error en la consola
      throw error;
    }
  }

  Future<void> signup(String name, String lastname, String email,
      String password, String phone) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final url = '$baseUrl/signup';

    const String defaultAddress = 'Sin dirección registrada';
    const String defaultImage =
        'https://dthezntil550i.cloudfront.net/f4/latest/f41908291942413280009640715/1280_960/1b2d9510-d66d-43a2-971a-cfcbb600e7fe.png';

    try {
      print('Signup URL: $url'); // Log de la URL
      print('Signup Request Body: ${json.encode({
            'name': name,
            'lastname': lastname,
            'email': email,
            'password': hashedPassword,
            'address': defaultAddress,
            'phone': phone,
            'image': defaultImage,
          })}'); // Log del cuerpo de la solicitud

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': name,
          'lastname': lastname,
          'email': email,
          'password': hashedPassword,
          'address': defaultAddress,
          'phone': phone,
          'image': defaultImage,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print(
          'Signup Response Status: ${response.statusCode}'); // Log del estado de la respuesta
      print(
          'Signup Response Body: ${response.body}'); // Log del cuerpo de la respuesta

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        _user = User.fromJson(responseData['user']);
        notifyListeners();
      } else {
        final responseData = json.decode(response.body);
        throw HttpException(responseData['error'] ?? 'Error desconocido');
      }
    } catch (error) {
      print('Signup error: $error'); // Imprimir el error en la consola
      throw error;
    }
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
