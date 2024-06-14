import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/mappers/pet_appointment_model.dart';
import 'package:movil/application/appointment_function/ui/pet_card.dart';

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
        },
        //agregar un builder para la lista dinámica después, el espaciado se agrega ahí >:D

        //children: [PetCard(), PetCard(), PetCard(), PetCard()],
      ),
    );
  }
}
