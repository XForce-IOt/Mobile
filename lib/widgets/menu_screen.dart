import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movil/main.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Mascotas',
    'Citas',
    'Calendario',
    'Perfil',
    'Ajustes'
  ];

  List<IconData> menuIcons = [
    FontAwesomeIcons.paw,
    FontAwesomeIcons.clipboard,
    FontAwesomeIcons.calendar,
    FontAwesomeIcons.user,
    FontAwesomeIcons.gear
  ];

  Widget buildMenuRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          Icon(
            menuIcons[index],
            color: Colors.white,
          ),
          const SizedBox(width: 20.0),
          Text(
            menuItems[index],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Material(
          child: Container(
            // ignore: sort_child_properties_last
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.white,
                      ),
                      Text(
                        'Fredy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: menuItems
                          .asMap()
                          .entries
                          .map((mapEntry) => buildMenuRow(mapEntry.key))
                          .toList()),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.rightFromBracket,
                              color: Colors.white),
                          Text(
                            'Cerrar Sesión',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.searchengin,
                              color: Colors.white),
                          Text(
                            'Logo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [startingColor, mainColor])),
          ),
        ));
  }
}
