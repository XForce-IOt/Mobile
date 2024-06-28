import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/pet_model.dart';

class PetService extends ChangeNotifier {
  final String baseUrl =
      'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/pet-owners';
  bool isLoading = true;
  List<Pet> pets = [];

  Future<void> getPets(int petOwnerId) async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('$baseUrl/$petOwnerId/pets');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        pets = body.map((dynamic item) => Pet.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load pets, status code: ${response.statusCode}, id del petowner ${petOwnerId}, body: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to load pets: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Pet> getPetById(String petOwnerId, String petId) async {
    final url = Uri.parse('$baseUrl/$petOwnerId/pets/$petId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Pet.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pet');
    }
  }
}
