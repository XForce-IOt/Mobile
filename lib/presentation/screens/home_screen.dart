import 'package:flutter/material.dart';
import 'package:movil/presentation/widgets/home/elevated_button_widget.dart';
import 'package:movil/presentation/widgets/home/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2BBCC5),
        elevation: 0,
        title: const UserTitle(userName: "Emerson Quispe"),
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
      body: const HomeBody(),
    );
  }
}

class UserTitle extends StatelessWidget {
  final String userName;

  const UserTitle({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PetCard(),
        SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonRow(buttons: [
                  ButtonConfig(icon: Icons.favorite, label: 'Heart Rate'),
                  ButtonConfig(
                      icon: Icons.directions_run, label: 'Activity Physics'),
                  ButtonConfig(icon: Icons.thermostat, label: 'Temperature'),
                ]),
                ButtonRow(buttons: [
                  ButtonConfig(
                      icon: Icons.brightness_2, label: 'Sleep Quality'),
                  ButtonConfig(icon: Icons.gps_fixed, label: 'GPS'),
                  ButtonConfig(icon: Icons.local_drink, label: 'Hydration'),
                ]),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class ButtonRow extends StatelessWidget {
  final List<ButtonConfig> buttons;

  const ButtonRow({
    required this.buttons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map((buttonConfig) => ElevatedButtonWidget(
                icon: buttonConfig.icon,
                label: buttonConfig.label,
              ))
          .toList(),
    );
  }
}

class ButtonConfig {
  final IconData icon;
  final String label;

  const ButtonConfig({required this.icon, required this.label});
}
