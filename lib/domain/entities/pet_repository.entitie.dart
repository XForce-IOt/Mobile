import 'package:movil/domain/entities/pet.entitie.dart';

abstract class PetRepository {
  Future<Pet> getPetById(String id);
  Future<void> savePet(Pet pet);
}
