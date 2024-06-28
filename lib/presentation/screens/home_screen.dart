import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil/shared/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../shared/model/pet_model.dart';
import '../../shared/services/pet_service.dart';
import '../widgets/home/carousel_widget.dart';
import '../widgets/home/tab_metrics_widget.dart';
import '../widgets/home/widget_selector_widget.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(user: user),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  final User user;

  const MyHomeScreen({super.key, required this.user});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int selectedPetIndex = 0;
  int selectedMetricIndex = -1;
  List<Pet> pets = [];
  bool isLoading = true;
  int petOwnerId = 1;
  //widget.user.id.toString()

  @override
  void initState() {
    super.initState();
    final petsProvider = Provider.of<PetService>(context, listen: false);
    petsProvider.getPets(petOwnerId).then((_) {
      setState(() {
        pets = petsProvider.pets;
        isLoading = false;
      });
    });
  }

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
                      "${widget.user.name} ${widget.user.lastName}",
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
