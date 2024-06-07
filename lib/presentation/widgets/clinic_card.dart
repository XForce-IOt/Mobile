import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 350,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                    child: Image.network(
                        'https://images.pexels.com/photos/5733422/pexels-photo-5733422.jpeg?auto=compress&cs=tinysrgb&w=600',
                        fit: BoxFit.cover)),
                title: Text("Dulces patitas titulo"),
                subtitle: const RatingStars(
                  axis: Axis.horizontal,
                  value: 4.5,
                  starCount: 5,
                  starSize: 20,
                  valueLabelColor: Colors.amber,
                  maxValue: 5,
                ),
              ),
              Text("Dirección larga"),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                Icon(Icons.phone),
                Text("999999999")
                ]
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                Icon(Icons.facebook),
                Text("Dulces patitas")
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
