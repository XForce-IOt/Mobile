// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movil/shared/model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfileScreen(user: user),
    );
  }
}

class MyProfileScreen extends StatefulWidget {
  final User user;

  const MyProfileScreen({super.key, required this.user});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _lastName;
  late String _address;
  late String _phone;
  late String _email;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _lastName = widget.user.lastName;
    _address = widget.user.address;
    _phone = widget.user.phone;
    _email = widget.user.email;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_name');
      print('LastName: $_lastName');
      print('Address: $_address');
      print('Phone: $_phone');
      print('Email: $_email');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customColor = Color(0xFF2BBCC5);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Profile',
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
                const Icon(
                  Icons.person,
                  size: 100,
                  color: customColor,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: _lastName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: _address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: _phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phone = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    initialValue: _email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
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
