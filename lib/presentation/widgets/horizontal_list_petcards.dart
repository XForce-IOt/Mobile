import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/pet_card.dart';

class HorizontalListPetCards extends StatelessWidget {
  const HorizontalListPetCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PetCard(),
          PetCard()
        ],
      ),
    );
  }
}
