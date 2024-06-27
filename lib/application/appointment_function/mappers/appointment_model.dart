class AppointmentModel {
  final int appointmentId;
  final int petId;
  final String title;
  final String dateTime;
  final String description;

  AppointmentModel({
    required this.appointmentId,
    required this.petId,
    required this.title,
    required this.dateTime,
    required this.description
  });
  
  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    appointmentId: (json["id"] as num).toInt(),
    petId: (json["petId"] as num).toInt(),
    title: json["title"],
    dateTime: json["dateTime"],
    description: json["description"]
  );

  Map<String, dynamic> toJson() => {
    "id": appointmentId,
    "petId": petId,
    "title": title,
    "dateTime": dateTime,
    "description": description
  };

}