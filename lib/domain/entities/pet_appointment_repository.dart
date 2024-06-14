import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';

class PetAppointmentRepository {
  String endpoint =
      'https://backend-production-6ed3.up.railway.app/api/pethealth/v1/pet-owners/1/pets';

  getPetsByUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => PetAppointmentModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
