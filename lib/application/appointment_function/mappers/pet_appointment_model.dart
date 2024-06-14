/*
class PetAppointmentModel {
  //final String id;
  String? name;
  String? specie;
  int? age;
  String? sex;
  String? size;
  double? weight;
  int? perimeter;
  String? image;

  PetAppointmentModel(
      {
      //required this.id,
      this.name,
      this.specie,
      this.age,
      this.sex,
      this.size,
      this.weight,
      this.perimeter,
      this.image});

  factory PetAppointmentModel.fromJson(Map<String, dynamic> json) {
    return PetAppointmentModel(
        name: json['name'],
        specie: json['specie'],
        age: json['age'],
        sex: json['sex'],
        size: json['size'],
        weight: json['weight'] ?? 'weight',
        perimeter: json['perimeter'] ?? 'permited perimeter',
        image: json['image'] ?? 'https://i.pinimg.com/736x/ca/4a/f2/ca4af20b57850bdc75c69d7da3a1fc25.jpg'
        );
  }
}
*/

import 'dart:convert';

List<PetAppointmentModel> petAppointmentModelFromJson(String str) => List<PetAppointmentModel>.from(json.decode(str).map((x) => PetAppointmentModel.fromJson(x)));

String petAppointmentModelToJson(List<PetAppointmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetAppointmentModel {
    final String name;
    final String specie;
    final int age;
    final String sex;
    final String size;
    final double weight;
    final int perimeter;
    final String image;

    PetAppointmentModel({
        required this.name,
        required this.specie,
        required this.age,
        required this.sex,
        required this.size,
        required this.weight,
        required this.perimeter,
        required this.image,
    });

    factory PetAppointmentModel.fromJson(Map<String, dynamic> json) => PetAppointmentModel(
        name: json["name"],
        specie: json["specie"],
        age: json["age"],
        sex: json["sex"],
        size: json["size"],
        weight: (json["weight"]as num).toDouble(),
        perimeter: (json["perimeter"] as num).toInt(),
        image: json["image"] ?? 'https://i.pinimg.com/736x/ca/4a/f2/ca4af20b57850bdc75c69d7da3a1fc25.jpg',
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "specie": specie,
        "age": age,
        "sex": sex,
        "size": size,
        "weight": weight,
        "perimeter": perimeter,
        "image": image,
    };
}