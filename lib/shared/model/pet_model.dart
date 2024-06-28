class Pet {
  final int id;
  final String name;
  final String specie;
  final int age;
  final String sex;
  final String size;
  final double perimeter;
  final String image;

  Pet({
    required this.id,
    required this.name,
    required this.specie,
    required this.age,
    required this.sex,
    required this.size,
    required this.perimeter,
    required this.image,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      specie: json['specie'],
      age: json['age'],
      sex: json['sex'],
      size: json['size'],
      perimeter: json['perimeter'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specie': specie,
      'age': age,
      'sex': sex,
      'size': size,
      'perimeter': perimeter,
      'image': image,
    };
  }
}
