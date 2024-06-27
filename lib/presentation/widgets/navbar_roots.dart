import 'package:flutter/material.dart';
import 'package:movil/shared/model/user_model.dart';
import 'package:movil/presentation/screens/appointments_screen.dart';
import 'package:movil/presentation/screens/home_screen.dart';
import 'package:movil/presentation/screens/profile_screen.dart';
import 'package:movil/presentation/screens/settings_screen.dart';

class NavBarRoots extends StatefulWidget {
  final User? user;

  const NavBarRoots({super.key, required this.user});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2BBCC5),
        title: Text(widget.user != null
            ? '${widget.user!.name} ${widget.user!.lastName}'
            : 'Welcome'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF042440),
          unselectedItemColor: const Color(0xFF2BBCC5),
          selectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
