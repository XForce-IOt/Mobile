import 'package:movil/domain/entities/health_data.entitie.dart';

class Pet {
  final String id;
  final String name;
  final String owner;
  final String species;
  final HealthData healthData;

  Pet({
    required this.id,
    required this.name,
    required this.owner,
    required this.species,
    required this.healthData,
  });
}
