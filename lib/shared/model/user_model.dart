class User {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String repassword;
  final String newpassword;
  final String address;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.repassword,
    required this.newpassword,
    required this.address,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      repassword: json['repassword'],
      newpassword: json['newpassword'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'repassword': repassword,
      'newpassword': newpassword,
      'address': address,
      'phone': phone,
    };
  }
}
