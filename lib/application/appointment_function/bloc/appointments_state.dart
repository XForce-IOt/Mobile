import 'package:flutter/cupertino.dart';
import 'package:movil/application/appointment_function/mappers/appointment_model.dart';

@immutable
abstract class AppointmentsState{}
abstract class AppointmentsActionState extends AppointmentsState{}

class AppointmentsInitial extends AppointmentsState {}
class AppointmentsFetchingLoadingState extends AppointmentsState {}
class AppointmentsFetchingErrorState extends AppointmentsState {}
class AppointmentsFetchingSuccesfulState extends AppointmentsState {
  final List<AppointmentModel> appointments;

  AppointmentsFetchingSuccesfulState({
    required this.appointments,
  });
}