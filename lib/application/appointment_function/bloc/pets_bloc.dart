// ignore_for_file: avoid_print

import 'dart:async';

import 'package:movil/application/appointment_function/bloc/pets_event.dart';
import 'package:bloc/bloc.dart';
import 'package:movil/application/appointment_function/bloc/pets_state.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';
import 'package:movil/application/appointment_function/repositorys/pets_appontment_repo.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetsBloc() : super(PetsInitial()) {
    on<PetsInitialFetchEvent>(petsInitialFetchEvent);
  }

  FutureOr<void> petsInitialFetchEvent(
      PetsInitialFetchEvent event, Emitter<dynamic> emit) async {
    emit(PetsFetchingLoadingState());
    List<PetAppointmentModel> pets = await PetsAppontmentRepo.fetchPets();

    emit(PetsFetchingSuccesfulState(pets: pets));
  }
}
