import 'dart:convert';
import 'dart:developer';

import 'package:movil/application/appointment_function/mappers/veterinarian_model.dart';
import 'package:http/http.dart' as http;

class VeterinariansRepo {
  static Future<List<VeterinarianModel>> fetchVeterinarians() async {
    var client = http.Client();
    List<VeterinarianModel> vets = [];

    try {
      var response = await client.get(Uri.parse(
          'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/clinics/2/veterinarians'));

      List result = jsonDecode(response.body);

      for (var i = 0; i < result.length; i++) {
        VeterinarianModel vet =
            VeterinarianModel.fromJson(result[i] as Map<String, dynamic>);
        vets.add(vet);
      }
      print(vets);
      return vets;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
