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
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: [
            Icon(
              menuIcons[index],
              color: selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            const SizedBox(width: 20.0),
            Text(
              menuItems[index],
              style: TextStyle(
                  color: selectedMenuIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24.0,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fredy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Dueño de mascotas',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: menuItems
                          .asMap()
                          .entries
                          .map((mapEntry) => buildMenuRow(mapEntry.key))
                          .toList()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.rightFromBracket,
                                color: Colors.white.withOpacity(0.5)),
                            Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.searchengin,
                                color: Colors.white),
                            Text(
                              'Logo',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
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
