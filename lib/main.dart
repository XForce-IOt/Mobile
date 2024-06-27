import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movil/shared/services/auth_service.dart';
import 'package:movil/presentation/screens/login_screen.dart';
import 'package:movil/presentation/screens/signup_screen.dart';
import 'package:movil/presentation/screens/welcome_screen.dart';
import 'package:movil/presentation/widgets/navbar_roots.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: Consumer<AuthService>(
        builder: (context, authService, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: authService.user == null
                ? const WelcomeScreen()
                : NavBarRoots(user: authService.user!),
            routes: {
              '/login': (ctx) => const LoginScreen(),
              '/signup': (ctx) => const SignUpScreen(),
              '/navbar': (ctx) => authService.user != null
                  ? NavBarRoots(user: authService.user!)
                  : const WelcomeScreen(),
              '/home': (ctx) => const WelcomeScreen(),
            },
          );
        },
      ),
    );
  }
}
