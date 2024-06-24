import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movil/application/appointment_function/bloc/clinics_event.dart';
import 'package:movil/application/appointment_function/bloc/clinics_state.dart';
import 'package:movil/application/appointment_function/mappers/clinic_model.dart';
import 'package:movil/application/appointment_function/repositorys/clinics_repo.dart';

class ClinicsBloc extends Bloc<ClinicsEvent, ClinicsState> {
  ClinicsBloc() : super(ClinicsInitial()) {
    on<ClinicsInitialFetchEvent>(clinicsInitialFetchEvent);
  }

  FutureOr<void> clinicsInitialFetchEvent(
      ClinicsInitialFetchEvent event, Emitter<dynamic> emit) async {
    emit(ClinicsFetchingLoadingState());
    //List of Clinics
    List<ClinicModel> clinics = await ClinicsRepo.fetchClinics();
    emit(ClinicsFetchingSuccesfulState(clinics: clinics));
  }
}
