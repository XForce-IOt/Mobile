import 'package:movil/domain/entities/health_data.entitie.dart';
import 'package:movil/domain/entities/pet_repository.entitie.dart';

class GetPetHealthData {
  final PetRepository repository;

  GetPetHealthData(this.repository);

  Future<HealthData> call(String petId) async {
    final pet = await repository.getPetById(petId);
    return pet.healthData;
  }
}
