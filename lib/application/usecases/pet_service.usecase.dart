import 'package:movil/application/usecases/get_pet_health_data.usecase.dart';
import 'package:movil/domain/entities/health_data.entitie.dart';

class PetService {
  final GetPetHealthData getPetHealthData;

  PetService(this.getPetHealthData);

  Future<HealthData> fetchPetHealthData(String petId) {
    return getPetHealthData(petId);
  }
}