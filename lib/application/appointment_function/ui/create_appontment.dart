// ignore_for_file: avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CreateAppointmentData extends StatefulWidget {
  const CreateAppointmentData({super.key});

  @override
  State<CreateAppointmentData> createState() => _CreateAppointmentDataState();
}

class _CreateAppointmentDataState extends State<CreateAppointmentData> {
  DateTime? selectDateTime = DateTime.now();

  showDatePicker() async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Disable 25th Feb 2023
        if (dateTime == DateTime(2023, 2, 25)) {
          return false;
        } else {
          return true;
        }
      },
    );
    print(dateTime);
    selectDateTime = dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //color: Colors.white,
      child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Add Appointment Detail",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF2BBCC5),
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2BBCC5),
                    foregroundColor: Colors.white),
                child: const Text("Select here!")),
            const SizedBox(height: 20),
            const Text(
              "Add Title",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF2BBCC5),
                  fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Add Tittle',
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Add Description",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF2BBCC5),
                  fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the appointment description',
              ),
            ),
            ElevatedButton(
                child: const Text("Create appointment"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2BBCC5),
                    foregroundColor: Colors.white),
                onPressed: () {
                  debugPrint("new appointment $selectDateTime");
                })
          ]),
    );
  }
}
