import 'package:flutter/material.dart';
import 'package:movil/widgets/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

Color mainColor = const Color(0xFF2BBCC5);
Color startingColor = const Color(0xFF2BBCC5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PetHealth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: mainColor),
        home: const MenuScreen());
  }
}
