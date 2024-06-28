import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WidgetSelector extends StatefulWidget {
  final String word;

  const WidgetSelector({super.key, required this.word});

  @override
  State<WidgetSelector> createState() => _WidgetSelectorState();
}

class _WidgetSelectorState extends State<WidgetSelector> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};

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

  @override
  Widget build(BuildContext context) {
    if (widget.word == "Heart Rate") {
      return heartRate(84);
    } else if (widget.word == 'Activity Physics') {
      return activity(90);
    } else if (widget.word == 'Temperature') {
      return thermostat(35);
    } else if (widget.word == 'Sleep Quality') {
      return bedTime(70);
    } else if (widget.word == 'GPS') {
      return gps();
    } else {
      return hydration(70);
    }
  }

  Widget heartRate(double metric) {
    return Column(
      children: [
        const Icon(Icons.monitor_heart_outlined, size: 140, color: Colors.red),
        Text(
          "$metric BPM",
          style: GoogleFonts.workSans(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF042440),
          ),
        )
      ],
    );
  }

  Widget activity(double currentCalories) {
    return ProgressIndicator(current: currentCalories, max: 200);
  }

  Widget thermostat(double metric) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.thermostat_auto_rounded, size: 140, color: Colors.red),
        Text(
          "$metric °C",
          style: GoogleFonts.workSans(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF042440),
          ),
        )
      ],
    );
  }

  Widget bedTime(double currentBed) {
    return ProgressIndicator(current: currentBed, max: 100);
  }

  Widget gps() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 250,
      ),
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
    );
  }

  Widget hydration(double currentHydration) {
    return ProgressIndicator(current: currentHydration, max: 100);
  }
}

class ProgressIndicator extends StatelessWidget {
  final double current;
  final double max;

  const ProgressIndicator({
    super.key,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    double percent = current / max;

    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 10.0,
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${(percent * 100).toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '$current / $max cal',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      progressColor: Colors.blue,
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
