import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabMetrics extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onTap;

  const TabMetrics(
      {super.key, required this.icon, required this.name, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 60.0, color: const Color(0xFF2BBCC5)),
            const SizedBox(height: 7.0),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.workSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
