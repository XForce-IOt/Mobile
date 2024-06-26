import 'package:flutter/material.dart';

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({super.key});

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Center(child: Text('All appos'),)
      );
  }
}