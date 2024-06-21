// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movil/application/appointment_function/bloc/pets_event.dart';
import 'package:bloc/bloc.dart';
import 'package:movil/application/appointment_function/bloc/pets_state.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetsBloc() : super(PetsInitial()) {
    on<PetsInitialFetchEvent>(petsInitialFetchEvent);
  }

  FutureOr<void> petsInitialFetchEvent(
      PetsInitialFetchEvent event, Emitter<dynamic> emit) async {
    var client = http.Client();
    List<PetAppointmentModel> pets = [];
    try {
      var response = await client.get(Uri.parse(
          'https://backend-production-6ed3.up.railway.app/api/pet-health/v1/pet-owners/1/pets'));

      List result = jsonDecode(response.body);
      print(result);

      for (var i = 0; i < result.length; i++) {
        PetAppointmentModel pet =
            PetAppointmentModel.fromJson(result[i] as Map<String, dynamic>);
        pets.add(pet);
      }
      //print(pets);

      emit(PetsFetchingSuccesfulState(pets: pets));
    } catch (e) {
      print(e.toString());
    }
  }
}
