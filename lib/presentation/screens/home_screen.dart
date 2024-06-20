import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int selectedPetIndex = 0;
  int selectedMetricIndex = -1;

  final List<Pet> pets = [
    Pet(name: 'Fido', type: 'Dog', age: 3, description: 'Friendly dog'),
    Pet(name: 'Whiskers', type: 'Cat', age: 2, description: 'Curious cat'),
    Pet(name: 'Tweety', type: 'Bird', age: 1, description: 'Chirpy bird')
  ];

  void onMetricSelected(int index) {
    setState(() {
      selectedMetricIndex = index;
    });
  }

  void onPetChanged(int index) {
    setState(() {
      selectedPetIndex = index;
      selectedMetricIndex = -1; // Reset metric selection when pet changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2BBCC5),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(
                  size: 30,
                  Icons.person_2_outlined,
                  color: Colors.white,
                )
              ],
            ),
            IconButton(
              icon: const Icon(size: 30, Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Acción del botón de notificaciones
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification button pressed')),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: 150,
                  width: double.infinity,
                  //color: const Color(0xFF2BBCC5),
                  decoration: const BoxDecoration(
                      color: Color(0xFF2BBCC5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Emerson Quispe",
                      style: GoogleFonts.workSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )),
              Positioned(
                top:
                    65.0, // Posiciona la tarjeta en la parte superior del Container
                left: 0.0, // Ajusta la posición horizontal
                right: 0.0, // Ajusta la posición horizontal
                child: Carousel(
                  pets: pets,
                  onPageChanged: onPetChanged,
                ),
              )
            ],
          ),
          const SizedBox(height: 130),
          IndexedStack(
            index: selectedMetricIndex + 1, // Add 1 to handle initial state
            children: [
              buildMetricsGrid(),
              buildMetricDetail(pets[selectedPetIndex], 'Heart Rate'),
              buildMetricDetail(pets[selectedPetIndex], 'Activity Physics'),
              buildMetricDetail(pets[selectedPetIndex], 'Temperature'),
              buildMetricDetail(pets[selectedPetIndex], 'Sleep Quality'),
              buildMetricDetail(pets[selectedPetIndex], 'GPS'),
              buildMetricDetail(pets[selectedPetIndex], 'Hydration'),
            ],
          ),
          //primera parte
        ],
      ),
    );
  }

  Widget buildMetricsGrid() {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE3E6EC),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: GridView.count(
            padding: const EdgeInsets.all(1.0),
            crossAxisCount: 3,
            children: <Widget>[
              TabMetrics(
                  icon: Icons.favorite,
                  name: "Heart Rate",
                  onTap: () => onMetricSelected(0)),
              TabMetrics(
                  icon: Icons.fitness_center,
                  name: "Activity Physics",
                  onTap: () => onMetricSelected(1)),
              TabMetrics(
                  icon: Icons.thermostat,
                  name: "Temperature",
                  onTap: () => onMetricSelected(2)),
              TabMetrics(
                  icon: Icons.bedtime,
                  name: "Sleep Quality",
                  onTap: () => onMetricSelected(3)),
              TabMetrics(
                  icon: Icons.gps_fixed,
                  name: "GPS",
                  onTap: () => onMetricSelected(4)),
              TabMetrics(
                  icon: Icons.water_drop,
                  name: "Hydration",
                  onTap: () => onMetricSelected(5)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMetricDetail(Pet pet, String metric) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E6EC),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 235,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: WidgetSelector(word: metric),
            /*Text(
              '$metric for ${pet.name}',
              style: GoogleFonts.workSans(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),*/
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Separación entre los elementos
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              miniTab(Icons.favorite, 0),
              miniTab(Icons.fitness_center, 1),
              miniTab(Icons.thermostat, 2),
              miniTab(Icons.bedtime, 3),
              miniTab(Icons.gps_fixed, 4),
              miniTab(Icons.water_drop, 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget miniTab(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: IconButton(
        icon: Icon(icon,
            size: 45,
            color: selectedMetricIndex == index
                ? const Color(0xFF042440)
                : const Color(0xFF2BBCC5)),
        onPressed: () => onMetricSelected(index),
      ),
    );
  }
}

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
                                  widget.pets[index].type,
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

class CardInfo extends StatelessWidget {
  final Pet pet;
  const CardInfo({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            const Icon(
              Icons.pets,
              size: 50,
              color: Colors.black,
            ),
            const SizedBox(width: 50),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pet.type,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  final double current;
  final double max;

  const ProgressIndicator({
    super.key,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    double percent = current / max;

    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 10.0,
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${(percent * 100).toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '$current / $max cal',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      progressColor: Colors.blue,
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class WidgetSelector extends StatefulWidget {
  final String word;

  const WidgetSelector({super.key, required this.word});

  @override
  State<WidgetSelector> createState() => _WidgetSelectorState();
}

class _WidgetSelectorState extends State<WidgetSelector> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};

  void _addMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.word == "Heart Rate") {
      return heartRate(84);
    } else if (widget.word == 'Activity Physics') {
      return activity(90);
    } else if (widget.word == 'Temperature') {
      return thermostat(35);
    } else if (widget.word == 'Sleep Quality') {
      return bedTime(70);
    } else if (widget.word == 'GPS') {
      return gps();
    } else {
      return hydration(70);
    }
  }

  Widget heartRate(double metric) {
    return Column(
      children: [
        const Icon(Icons.monitor_heart_outlined, size: 140, color: Colors.red),
        Text(
          "$metric BPM",
          style: GoogleFonts.workSans(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF042440),
          ),
        )
      ],
    );
  }

  Widget activity(double currentCalories) {
    return ProgressIndicator(current: currentCalories, max: 200);
  }

  Widget thermostat(double metric) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.thermostat_auto_rounded, size: 140, color: Colors.red),
        Text(
          "$metric °C",
          style: GoogleFonts.workSans(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF042440),
          ),
        )
      ],
    );
  }

  Widget bedTime(double currentBed) {
    return ProgressIndicator(current: currentBed, max: 100);
  }

  Widget gps() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 250,
      ),
      child: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        onTap: _addMarker,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-12.0464, -77.0428),
          zoom: 14,
        ),
        markers: _markers,
      ),
    );
  }

  Widget hydration(double currentHydration) {
    return ProgressIndicator(current: currentHydration, max: 100);
  }
}

class Pet {
  final String name;
  final String type;
  //final String sex;
  final int age;
  //final String size;
  //final Double perimeter;
  final String description;

  Pet(
      {required this.name,
      required this.type,
      required this.age,
      required this.description});
}
