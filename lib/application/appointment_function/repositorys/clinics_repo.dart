import 'dart:convert';
import 'dart:developer';

import 'package:movil/application/appointment_function/mappers/clinic_model.dart';
import 'package:http/http.dart' as http;

class ClinicsRepo {
  static Future<List<ClinicModel>> fetchClinics() async {
    var client = http.Client();
    List<ClinicModel> clinics = [];

    try {
      var response = await client.get(Uri.parse(
          'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/clinics'));

      List result = jsonDecode(response.body);

      for (var i = 0; i < result.length; i++) {
        ClinicModel clinic =
            ClinicModel.fromJson(result[i] as Map<String, dynamic>);
        clinics.add(clinic);
      }

      return clinics;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
