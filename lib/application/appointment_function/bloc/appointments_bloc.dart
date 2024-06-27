import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movil/application/appointment_function/bloc/appointments_event.dart';
import 'package:movil/application/appointment_function/bloc/appointments_state.dart';
import 'package:movil/application/appointment_function/mappers/appointment_model.dart';
import 'package:movil/application/appointment_function/repositorys/appointments_repo.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc(): super(AppointmentsInitial()) {
    on<AppointmentsInitialFetchEvent>(appointmentsInitialFetchEvent);
  }

  FutureOr<void> appointmentsInitialFetchEvent(
      AppointmentsInitialFetchEvent event, Emitter<dynamic> emit) async {
    emit(AppointmentsFetchingLoadingState());
    //List of Appointments
    List<AppointmentModel> appointments = await AppointmentsRepo.fetchAppointments();
    emit(AppointmentsFetchingSuccesfulState(appointments: appointments));
  }
}