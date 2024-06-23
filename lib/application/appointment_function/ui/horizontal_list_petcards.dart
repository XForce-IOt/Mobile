import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';

class HorizontalListPetCards extends StatefulWidget {
  final List<PetAppointmentModel> pets;

  const HorizontalListPetCards({super.key, required this.pets});

  @override
  State<HorizontalListPetCards> createState() => _HorizontalListPetCardsState();
}

class _HorizontalListPetCardsState extends State<HorizontalListPetCards> {
  late List<PetAppointmentModel> pets;

  @override
  void initState() {
    super.initState();
    pets = widget.pets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return PetCard(pet: pet);
        }
      ),
    );
  }
}

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
                      constraints:
                          const BoxConstraints(maxHeight: 70, maxWidth: 70),
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