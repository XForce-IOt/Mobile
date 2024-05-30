import 'package:flutter/material.dart';
import 'package:movil/presentation/screens/login_screen.dart';
import 'package:movil/presentation/screens/signup_screen.dart';
import 'package:movil/presentation/widgets/navbar_roots.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/top-auth.png',
                width: MediaQuery.of(context).size.width / 1.2,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const NavBarRoots();
                          },
                        ));
                      },
                      child: const Text(
                        'SKIP',
                        style:
                            TextStyle(color: Color(0xFF042440), fontSize: 20),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/logo.png')),
                const Text(
                  '"Better Care, Happy Pets"',
                  style: TextStyle(
                    color: Color.fromARGB(164, 4, 36, 64),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: const Color(0xFF2BBCC5),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: const Color(0xFF2BBCC5),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom-auth.png',
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
