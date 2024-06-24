import 'package:flutter/material.dart';

import '../mappers/veterinarian_model.dart';

class VerticalListVets extends StatefulWidget {
  final List<VeterinarianModel> vets;
  const VerticalListVets({super.key, required this.vets});

  @override
  State<VerticalListVets> createState() => _VerticalListVetsState();
}

class _VerticalListVetsState extends State<VerticalListVets> {
  late List<VeterinarianModel> vets;

  @override
  void initState() {
    super.initState();
    vets = widget.vets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: vets.length,
          itemBuilder: (context, index) {
            final vet = vets[index];
            return (VeterinarianCard(vet: vet));
          }),
    );
  }
}

class VeterinarianCard extends StatelessWidget {
  final VeterinarianModel vet;
  const VeterinarianCard({super.key, required this.vet});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 100, maxWidth: 100),
                  child: Image.network(
                      'https://images.pexels.com/photos/5733422/pexels-photo-5733422.jpeg?auto=compress&cs=tinysrgb&w=600',
                      fit: BoxFit.cover)),
              Text(vet.fullName),
              ElevatedButton(
                  child: const Text("Select"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2BBCC5),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    debugPrint("oliii vet");
                  })
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Availability: M - M - F"),
              const Text("Hours: 10 AM - 1 PM / 2:30 PM - 7:PM"),
              Text(vet.specialization),
              Text(vet.contactInfo)
            ],
          )
        ],
      )),
    );
  }
}
