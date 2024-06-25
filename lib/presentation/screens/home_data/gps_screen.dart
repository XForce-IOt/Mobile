// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movil/presentation/widgets/home/elevated_button_widget.dart';
import 'package:movil/presentation/widgets/home/pet_card.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({super.key});

  @override
  State<GpsScreen> createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> {
  final Color customColor = const Color(0xFF2BBCC5);
  final String userName = "John Doe";

  GoogleMapController? _controller;
  Set<Marker> _markers = {};

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
                'GPS',
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
              child: GoogleMap(
                onMapCreated: (controller) {
                  _controller = controller;
                },
                onTap: _addMarker,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-12.0464, -77.0428),
                  zoom: 14,
                ),
                markers: _markers,
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
                    icon: Icons.thermostat, label: 'Temperature'),
                ElevatedButtonWidget(
                    icon: Icons.brightness_2, label: 'Sleep Quality'),
                ElevatedButtonWidget(
                    icon: Icons.local_drink, label: 'Hydration'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
        ),
      );
    });
  }
}