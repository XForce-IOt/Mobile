import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//color 2BBCC5

Color mainColor = const Color(0xFF2BBCC5);
Color startingColor = const Color(0xFF2BBCC5);

class MyApp extends StatelessWidget {
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
            child: const SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      Text(
                        'PetHealth',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
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
