import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/home/elevated_button_widget.dart';
import 'package:movil/presentation/widgets/home/pet_card.dart';

class TemperatureScreen extends StatelessWidget {
  final Color customColor = const Color(0xFF2BBCC5);
  final String userName = "John Doe";

  const TemperatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notification button pressed'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const PetCard(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(
              maxWidth: 350,
              maxHeight: 250,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: customColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.thermostat,
                    size: 70,
                    color: customColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '36.8°C',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: customColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButtonWidget(icon: Icons.favorite, label: 'Heart Rate'),
                ElevatedButtonWidget(
                    icon: Icons.directions_run, label: 'Activity Physics'),
                ElevatedButtonWidget(
                    icon: Icons.brightness_2, label: 'Sleep Quality'),
                ElevatedButtonWidget(icon: Icons.gps_fixed, label: 'GPS'),
                ElevatedButtonWidget(
                    icon: Icons.local_drink, label: 'Hydration'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
