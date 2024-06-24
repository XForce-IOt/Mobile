import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movil/application/appointment_function/bloc/vets_event.dart';
import 'package:movil/application/appointment_function/bloc/vets_state.dart';
import 'package:movil/application/appointment_function/repositorys/veterinarians_repo.dart';

import '../mappers/veterinarian_model.dart';

class VetsBloc extends Bloc<VetsEvent, VetsState> {
  VetsBloc() : super(VetsInitial()) {
    on<VetsInitialFetchEvent>(vetsInitialFetchEvent);
  }

  FutureOr<void> vetsInitialFetchEvent(
      VetsInitialFetchEvent event, Emitter<dynamic> emit) async {
    emit(VetsFetchingLoadingState());
    List<VeterinarianModel> vets = await VeterinariansRepo.fetchVeterinarians();
    emit(VetsFetchingSuccessfulState(vets: vets));
  }
}
