import 'package:flutter/material.dart';
import 'package:movil/application/appointment_function/mappers/appointment_model.dart';

class AppointmentList extends StatefulWidget {
  final List<AppointmentModel> appointments;

  const AppointmentList({super.key, required this.appointments});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  late List<AppointmentModel> appointments;

  @override
  void initState() {
    super.initState();
    appointments = widget.appointments;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,  // Ajusta la altura según necesites
      child: ListView.builder(
        itemCount: widget.appointments.length,
        itemBuilder: (context, index) {
          final appointment = widget.appointments[index];
          return AppointmentCard(appointment: appointment);
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.event_available),
        title: Text(appointment.title),
        subtitle: Text('${appointment.description}\n${appointment.dateTime}'),
        trailing: Text('Pet ID: ${appointment.petId}'),
        onTap: () {
          // Acción al tocar la tarjeta, por ejemplo, abrir detalles
          print("Appointment tapped!");
        },
      ),
    );
  }
}