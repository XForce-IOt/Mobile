import 'package:flutter/material.dart';
import 'package:movil/presentation/screens/home_data/activity_physics_screen.dart';
import 'package:movil/presentation/screens/home_data/heart_rate_screen.dart';
import 'package:movil/presentation/screens/home_data/gps_screen.dart';
import 'package:movil/presentation/screens/home_data/sleep_quality_screen.dart';
import 'package:movil/presentation/screens/home_data/temperature_screen.dart';

class HydrationScreen extends StatelessWidget {
  final Color customColor = const Color(0xFF2BBCC5);
  final String userName = "John Doe"; // Nombre del usuario
  final String petName = "Vaguito"; // Nombre de la mascota
  final String petBreed = "Golden Retriever";

  const HydrationScreen({super.key}); // Raza de la mascota

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
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Acción del botón de notificaciones
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notification button pressed'),
                  ),
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
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName,
                        style: const TextStyle(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
              child: Text(
                'Hydration',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Cuadro para mostrar datos
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(
              maxWidth: 350, // Ajusta el ancho máximo aquí
              maxHeight: 250,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: customColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_drink,
                    size: 70,
                    color: customColor, // Color
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '75% Hydrous',
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildElevatedButton(Icons.favorite, 'Heart Rate', context),
                _buildElevatedButton(
                    Icons.directions_run, 'Activity Physics', context),
                _buildElevatedButton(Icons.thermostat, 'Temperature', context),
                _buildElevatedButton(
                    Icons.brightness_2, 'Sleep Quality', context),
                _buildElevatedButton(Icons.gps_fixed, 'GPS', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
      IconData icon, String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _navigateToScreen(label, context);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 14.0), // Ajusta el tamaño del botón
          backgroundColor: Colors.white,
          side: BorderSide(color: customColor),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Ajusta la esquina del botón
          ),
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
      case 'GPS':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const GpsScreen()),
        );
        break;
      case 'Activity Physics':
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const ActivityPhysicsScreen()),
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
