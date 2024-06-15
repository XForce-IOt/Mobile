import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/ui/clinic_card.dart';
import 'package:movil/application/appointment_function/ui/veterinarian_card.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    /*return ListView.builder(

      itemCount: 1,
      itemBuilder: ,
    );*/
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Select a Clinic",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              ClinicCard(),
              ClinicCard(),
              ClinicCard(),
              VeterinarianCard()
            ],
          ))
        ],
      ),
    );
  }
}