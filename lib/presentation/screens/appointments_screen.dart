import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/horizontal_list_petcards.dart';
import 'package:movil/presentation/widgets/pet_card.dart';
import 'package:movil/presentation/widgets/vertical_list.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //child: Text("Appointment Screen"),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFF2BBCC5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: const Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Schedule appointments",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                HorizontalListPetCards()
              ],
            ),
          ),
          Expanded(
              child: VerticalList()
          )
        ],
      ),
    );
  }
}
