class User {
  final int id;
  final String name;
  final String lastName;
  final String address;
  final String phone;
  final String email;
  final String password;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'address': address,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
