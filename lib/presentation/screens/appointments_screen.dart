import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/horizontal_list_petcards.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      //child: Text("Appointment Screen"),
      child: HorizontalListPetCards(),
      
    );
  }
}