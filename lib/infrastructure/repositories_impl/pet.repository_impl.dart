import 'package:movil/infrastructure/datasources/pet.datasource.dart';

import '../../domain/entities/pet.entitie.dart';
import '../../domain/entities/pet_repository.entitie.dart';

class PetRepositoryImpl implements PetRepository {
  final PetDataSource dataSource;

  PetRepositoryImpl(this.dataSource);

  @override
  Future<Pet> getPetById(String id) {
    return dataSource.fetchPetById(id);
  }

  @override
  Future<void> savePet(Pet pet) {
    return dataSource.storePet(pet);
  }
}