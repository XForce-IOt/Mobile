import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint("oliii");
          },
          child: Container(
            width: 350,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: 70, maxWidth: 70),
                      child: Image.network(
                          'https://images.pexels.com/photos/5733422/pexels-photo-5733422.jpeg?auto=compress&cs=tinysrgb&w=600',
                          fit: BoxFit.cover)),
                  title: const Text("Dulces patitas titulo"),
                  subtitle: const RatingStars(
                    axis: Axis.horizontal,
                    value: 4.5,
                    starCount: 5,
                    starSize: 20,
                    valueLabelColor: Colors.amber,
                    maxValue: 5,
                  ),
                ),
                const Text("Dirección larga"),
                const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [Icon(Icons.phone), Text("999999999")]),
                const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [Icon(Icons.facebook), Text("Dulces patitas")])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
