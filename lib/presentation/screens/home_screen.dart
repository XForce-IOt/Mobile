import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movil/presentation/screens/home_data/heart_rate_screen.dart';
import 'package:movil/presentation/screens/home_data/activity_physics_screen.dart';
import 'package:movil/presentation/screens/home_data/gps_screen.dart';
import 'package:movil/presentation/screens/home_data/hydration_screen.dart';
import 'package:movil/presentation/screens/home_data/sleep_quality_screen.dart';
import 'package:movil/presentation/screens/home_data/temperature_screen.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final List<Pet> pets = [
  Pet(name: 'Fido', type: 'Dog', age: 3, description: 'Friendly dog'),
  Pet(name: 'Whiskers', type: 'Cat', age: 2, description: 'Curious cat'),
  Pet(name: 'Tweety', type: 'Bird', age: 1, description: 'Chirpy bird')
];

  @override
  Widget build(BuildContext context) {
    //List<Widget> petCards = pets.map((pet) => CardInfo(pet: pet)).toList();

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
              icon: const Icon(
                size: 30, Icons.notifications),
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
                  color:  Color(0xFF2BBCC5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text( "Emerson Quispe",
                    style: GoogleFonts.workSans(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                )

              ),
              Positioned(
                top: 50.0, // Posiciona la tarjeta en la parte superior del Container
                left: 20.0, // Ajusta la posición horizontal
                right: 20.0, // Ajusta la posición horizontal
                child: Carousel(
                  pets: pets,
                ),
                
              )
            ],
          ),

          const SizedBox(height: 100),
          SizedBox(
            height: 270,
            child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE3E6EC),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child:GridView.count(
                  padding: EdgeInsets.all(2.0),
                  crossAxisCount: 3,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HeartRateScreen()));
                      },
                      child: TabMetrics(icon: Icons.favorite, name: "Heart Rate")
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPhysicsScreen()));
                        },
                        child: TabMetrics(icon: Icons.fitness_center, name: "Activity Physics")
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TemperatureScreen()));
                        },
                        child: TabMetrics(icon: Icons.thermostat, name: "Temperature")
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SleepQualityScreen()));
                        },
                        child: TabMetrics(icon: Icons.bedtime, name: "Sleep Quality")
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GpsScreen()));
                        },
                        child: TabMetrics(icon: Icons.gps_fixed, name: "GPS")
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HydrationScreen()));
                        },
                        child: TabMetrics(icon: Icons.water_drop, name: "Hydration")
                    ),
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class TabMetrics extends StatelessWidget{
  final IconData icon;
  final String name;

  TabMetrics({required this.icon, required this.name});
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
              icon,
              size: 50.0,
              color: const Color(0xFF2BBCC5)
          ),
          const SizedBox(height: 10.0),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'WorkSans',
                color: Color(0xFF042440)
            ),
          ),
        ],

      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final List<Pet> pets;
  const Carousel({super.key, required this.pets});

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
            onPageChanged: (index){
              setState(() {
                selectedIndex = index;
              });
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
                          children:[ 
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
                          ] 
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        )
        /*Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE3E6EC),
            borderRadius: BorderRadius.circular(15)
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${pets[selectedIndex].name}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF042440),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Type: ${pets[selectedIndex].type}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF042440),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Age: ${pets[selectedIndex].age}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF042440),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Description: ${pets[selectedIndex].description}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'WorkSans',
                    color: Color(0xFF042440),
                  ),
                ),
              ]
          ),
        )*/
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
            SizedBox(width: 50),
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

class Pet {
  final String name;
  final String type;
  //final String sex;
  final int age;
  //final String size;
  //final Double perimeter;
  final String description;

  Pet({required this.name, required this.type, required this.age, required this.description});
}