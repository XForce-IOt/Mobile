import 'package:movil/domain/entities/pet.entitie.dart';

abstract class PetDataSource {
  Future<Pet> fetchPetById(String id);
  Future<void> storePet(Pet pet);
}