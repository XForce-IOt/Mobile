class VeterinarianModel {
  final int veterinarianId;
  final String fullName;
  final String password;
  final String specialization;
  final String contactInfo;

  VeterinarianModel({
    required this.veterinarianId,
    required this.fullName,
    required this.password,
    required this.specialization,
    required this.contactInfo,
  });

  factory VeterinarianModel.fromJson(Map<String, dynamic> json) => VeterinarianModel(
        veterinarianId: (json["clinicId"] as num).toInt(),
        fullName: json["name"],
        password: json["password"],
        specialization: json["specialization"],
        contactInfo: json["contactInfo"]
    );

    Map<String, dynamic> toJson() => {
        "veterinarianId": veterinarianId,
        "fullName": fullName,
        "password": password,
        "specialization": specialization,
        "contactInfo": contactInfo,
    };
}
