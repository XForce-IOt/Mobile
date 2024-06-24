import 'package:flutter/cupertino.dart';

import '../mappers/veterinarian_model.dart';

@immutable
abstract class VetsState {}

abstract class VetsActionState extends VetsState {}

class VetsInitial extends VetsState {}

class VetsFetchingLoadingState extends VetsState {}

class VetsFetchingErrorState extends VetsState {}

class VetsFetchingSuccessfulState extends VetsState {
  final List<VeterinarianModel> vets;

  VetsFetchingSuccessfulState({
    required this.vets,
  });
}
