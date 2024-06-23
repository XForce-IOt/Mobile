import 'dart:convert';
import 'dart:developer';

import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';
import 'package:http/http.dart' as http;

class PetsAppontmentRepo {
  static Future<List<PetAppointmentModel>> fetchPets() async {
    var client = http.Client();
    List<PetAppointmentModel> pets = [];
    try {
      var response = await client.get(Uri.parse(
          'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/pet-owners/1/pets'));

      List result = jsonDecode(response.body);
      //print(result);

      for (var i = 0; i < result.length; i++) {
        PetAppointmentModel pet =
            PetAppointmentModel.fromJson(result[i] as Map<String, dynamic>);
        pets.add(pet);
      }
      //print(pets);
      return pets;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
