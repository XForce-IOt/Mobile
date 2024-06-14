import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';

class PetCard extends StatelessWidget {
  final PetAppointmentModel pet;
  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 300,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                      child: Image.network(pet.image, fit: BoxFit.cover)),
                  title: Text(pet.name),
                  subtitle: Text(pet.specie))
            ],
          ),
        ),
      ),
    );
  }
}
