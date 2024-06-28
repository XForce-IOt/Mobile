import 'package:flutter/material.dart';

import '../../../shared/model/pet_model.dart';

class Carousel extends StatefulWidget {
  final List<Pet> pets;
  final Function(int) onPageChanged;

  const Carousel({
    super.key,
    required this.pets,
    required this.onPageChanged,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 150,
            width: double.infinity,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: widget.pets.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
                widget.onPageChanged(index);
              },
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.pets,
                          size: 70,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.pets[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.pets[index].specie,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
        //segunda parte
      ],
    );
  }
}
