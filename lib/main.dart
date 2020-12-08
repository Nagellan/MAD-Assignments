import 'package:assignment_3/pages/home/home.dart';
import 'package:assignment_3/pages/pet_profile/pet_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/profile': (context) => PetProfile(),
      },
    ),
  );
}
