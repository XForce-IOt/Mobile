import 'package:flutter/cupertino.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';

@immutable
abstract class PetsState {}

abstract class PetsActionState extends PetsState {}

class PetsInitial extends PetsState {}

//class PetsFetchingLoadingState extends PetsState {}

//class PetsFetchingErrorState extends PetsState {}

class PetsFetchingSuccesfulState extends PetsState {
  final List<PetAppointmentModel> pets;

  PetsFetchingSuccesfulState({
    required this.pets,
  });
}
