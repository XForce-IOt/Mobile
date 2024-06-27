import 'dart:convert';
import 'dart:developer';

import 'package:movil/application/appointment_function/mappers/appointment_model.dart';
import 'package:http/http.dart' as http;

class AppointmentsRepo {
  static Future<List<AppointmentModel>> fetchAppointments() async {
    var client = http.Client();
    List<AppointmentModel> appointments = [];

    try {
      var response = await client.get(Uri.parse(
          'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/clinics/1/veterinarians/1/pet-owners/1/appointments/by-pet-owner'));

      List result = jsonDecode(response.body);

      for (var i = 0; i < result.length; i++) {
        AppointmentModel appointment =
            AppointmentModel.fromJson(result[i] as Map<String, dynamic>);
        appointments.add(appointment);
      }

      return appointments;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}