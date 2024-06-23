class ClinicModel {
  final int clinicId;
  final double rating;
  final String name;
  final String number;
  final String socialMedia;
  final String profilePicture;

  ClinicModel({
    required this.clinicId, 
    required this.rating, 
    required this.name, 
    required this.number, 
    required this.socialMedia, 
    required this.profilePicture
    });
  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        clinicId: (json["clinicId"] as num).toInt(),
        rating: (json["rating"] as num).toDouble(),
        name: json["name"],
        number: json["number"],
        socialMedia: json["socialMedia"],
        profilePicture: json["profilePicture"] ?? 'https://i.pinimg.com/736x/ca/4a/f2/ca4af20b57850bdc75c69d7da3a1fc25.jpg',
    );

    Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "ratingId": rating,
        "name": name,
        "number": number,
        "socialMedia": socialMedia,
        "profilePicture": profilePicture
    };
}
