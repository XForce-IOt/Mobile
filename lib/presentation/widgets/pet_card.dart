import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key});

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
              const ListTile(
                leading: Icon(Icons.pets_outlined),
                title: Text("Vaguito"),
                subtitle: Text("Raza: Pastor alemán")
              )
            ],
          ),
          
          
        ),
      ),
    );
  }
}