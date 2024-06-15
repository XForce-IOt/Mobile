import 'package:flutter/material.dart';
import 'package:movil/presentation/screens/home_data/heart_rate_screen.dart';
import 'package:movil/presentation/screens/home_data/activity_physics_screen.dart';
import 'package:movil/presentation/screens/home_data/gps_screen.dart';
import 'package:movil/presentation/screens/home_data/hydration_screen.dart';
import 'package:movil/presentation/screens/home_data/sleep_quality_screen.dart';
import 'package:movil/presentation/screens/home_data/temperature_screen.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const ElevatedButtonWidget({
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _navigateToScreen(label, context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: customColor),
          padding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          minimumSize: const Size(0, 100),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: customColor,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: customColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(String label, BuildContext context) {
    switch (label) {
      case 'Heart Rate':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HeartRateScreen()),
        );
        break;
      case 'Activity Physics':
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const ActivityPhysicsScreen()),
        );
        break;
      case 'GPS':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const GpsScreen()),
        );
        break;
      case 'Hydration':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HydrationScreen()),
        );
        break;
      case 'Sleep Quality':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SleepQualityScreen()),
        );
        break;
      case 'Temperature':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TemperatureScreen()),
        );
        break;
      default:
    }
  }
}
