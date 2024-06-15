// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySettingsScreen(),
    );
  }
}

class MySettingsScreen extends StatefulWidget {
  const MySettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySettingsScreenState createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _currentPassword = '';
  String _newPassword = '';
  String _repeatNewPassword = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('CurrentPassword: $_currentPassword');
      print('NewPassword: $_newPassword');
      print('RepeatNewPassword: $_repeatNewPassword');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color customColor = const Color(0xFF2BBCC5);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Password',
            style: TextStyle(
              color: Colors.white, // Color del texto del título
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true, // Centrar el título en la AppBar
        backgroundColor:
            customColor, // Fondo transparente para que el contenedor sea visible
        elevation: 0, // Sin sombra
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 100,
                  color: customColor,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Saúl Mendoza',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Current password',
                    ),
                    obscureText: true, // Ocultar el texto de la contraseña
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _currentPassword = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New password',
                    ),
                    obscureText: true, // Ocultar el texto de la contraseña
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
                      }
                      if (value == _currentPassword) {
                        return 'The new password cant be the same as the current';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _newPassword = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm the new password',
                    ),
                    obscureText: true, // Ocultar el texto de la contraseña
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the new password again';
                      }
                      /*if (value != _newPassword){
                        return 'Does not match new password';
                      }*/
                      return null;
                    },
                    onSaved: (value) {
                      _repeatNewPassword = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: customColor,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
