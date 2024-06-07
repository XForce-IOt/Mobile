import 'package:flutter/material.dart';
import 'package:movil/presentation/screens/home_data/heart_rate_screen.dart';
import 'package:movil/presentation/screens/home_data/activity_physics_screen.dart';
import 'package:movil/presentation/screens/home_data/gps_screen.dart';
import 'package:movil/presentation/screens/home_data/hydration_screen.dart';
import 'package:movil/presentation/screens/home_data/sleep_quality_screen.dart';
import 'package:movil/presentation/screens/home_data/temperature_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final Color customColor = Color(0xFF2BBCC5);
  final String userName = "Emerson Quispe";
  final String petName = "Vaguito";
  final String petBreed = "Golden Retriever";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Acción del botón de notificaciones
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification button pressed')),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.pets,
                    size: 50,
                    color: customColor,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        petBreed,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildElevatedButton(
                          Icons.favorite, 'Heart Rate', context),
                      _buildElevatedButton(
                          Icons.directions_run, 'Activity Physics', context),
                      _buildElevatedButton(
                          Icons.thermostat, 'Temperature', context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildElevatedButton(
                          Icons.brightness_2, 'Sleep Quality', context),
                      _buildElevatedButton(Icons.gps_fixed, 'GPS', context),
                      _buildElevatedButton(
                          Icons.local_drink, 'Hydration', context),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(IconData icon, String label,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _navigateToScreen(label, context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: customColor),
          padding: EdgeInsets.all(10.0), // Ajusta el espacio interno del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                5.0), // Ajusta la esquina del botón
          ),
          minimumSize: Size(0, 100), // Ajusta la altura del botón
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: customColor,
            ),
            SizedBox(height: 8),
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
          MaterialPageRoute(builder: (context) => HeartRateScreen()),
        );
        break;
      case 'Activity Physics':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ActivityPhysicsScreen()),
        );
        break;
      case 'GPS':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => GpsScreen()),
        );
        break;
      case 'Hydration':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HydrationScreen()),
        );
        break;
      case 'Sleep Quality':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SleepQualityScreen()),
        );
        break;
      case 'Temperature':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TemperatureScreen()),
        );
        break;
    // Agrega más casos para las demás opciones de botón...
      default:
      // Manejar caso por defecto
    }
  }
}