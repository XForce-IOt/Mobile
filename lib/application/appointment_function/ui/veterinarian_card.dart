import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VeterinarianCard extends StatelessWidget {
  const VeterinarianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                  child: Image.network(
                      'https://images.pexels.com/photos/5733422/pexels-photo-5733422.jpeg?auto=compress&cs=tinysrgb&w=600',
                      fit: BoxFit.cover)),
              Text("Nombre Apellido"),
              ElevatedButton(
                child: const Text("Select"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2BBCC5),
                  foregroundColor: Colors.white
                ),
                onPressed: () {
                  debugPrint("oliii vet");
                }
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Availability: M - M - F"),
              Text("Hours: 10 AM - 1 PM / 2:30 PM - 7:PM"),
              Text("Mail: omarramos@gmail.com"),
              Text("Whatsapp: 989666666")
            ],
          )
        ],
      )),
    );
  }
}
