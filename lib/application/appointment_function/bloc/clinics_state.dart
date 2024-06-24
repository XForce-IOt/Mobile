import 'package:flutter/cupertino.dart';
import 'package:movil/application/appointment_function/mappers/clinic_model.dart';

@immutable
abstract class ClinicsState{}
abstract class ClinicsActionState extends ClinicsState{}

class ClinicsInitial extends ClinicsState{}
class ClinicsFetchingLoadingState extends ClinicsState{}
class ClinicsFetchingErrorState extends ClinicsState{}
class ClinicsFetchingSuccesfulState extends ClinicsState {
  final List<ClinicModel> clinics;

  ClinicsFetchingSuccesfulState({
    required this.clinics,
  });
}