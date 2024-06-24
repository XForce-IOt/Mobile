import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:movil/application/appointment_function/mappers/clinic_model.dart';

class VerticalListClinics extends StatefulWidget {
  final List<ClinicModel> clinics;

  const VerticalListClinics({super.key, required this.clinics});

  @override
  State<VerticalListClinics> createState() => _VerticalListClinicsState();
}

class _VerticalListClinicsState extends State<VerticalListClinics> {
  late List<ClinicModel> clinics;

  @override
  void initState() {
    super.initState();
    clinics = widget.clinics;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          final clinic = clinics[index];
          return ClinicCard(clinic: clinic);
        },
      ),
    );
  }
}

class ClinicCard extends StatelessWidget {
  final ClinicModel clinic;
  const ClinicCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint("oliii");
          },
          child: Container(
            width: 350,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: 70, maxWidth: 70),
                      child: Image.network(
                          'https://images.pexels.com/photos/5733422/pexels-photo-5733422.jpeg?auto=compress&cs=tinysrgb&w=600',
                          fit: BoxFit.cover)),
                  title: Text(clinic.name),
                  subtitle: RatingStars(
                    axis: Axis.horizontal,
                    value: clinic.rating,
                    starCount: 5,
                    starSize: 20,
                    valueLabelColor: Colors.amber,
                    maxValue: 5,
                  ),
                ),
                const Text("Dirección larga"),
                Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [const Icon(Icons.phone), Text(clinic.number)]),
                Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [const Icon(Icons.facebook), Text(clinic.socialMedia)])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
