import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/home/elevated_button_widget.dart';
import 'package:movil/presentation/widgets/home/pet_card.dart';

class SleepQualityScreen extends StatelessWidget {
  final Color customColor = const Color(0xFF2BBCC5);
  final String userName = "John Doe";
  final double sleepPercentage = 75.0;

  const SleepQualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.person,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              userName,
              style: const TextStyle(
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
                'Sleep Quality',
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    value: sleepPercentage / 100,
                    strokeWidth: 10,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$sleepPercentage Points',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                ElevatedButtonWidget(icon: Icons.directions_run, label: 'Activity Physics'),
                ElevatedButtonWidget(icon: Icons.thermostat, label: 'Temperature'),
                ElevatedButtonWidget(icon: Icons.gps_fixed, label: 'GPS'),
                ElevatedButtonWidget(icon: Icons.local_drink, label: 'Hydration'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
