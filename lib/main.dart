import 'package:flutter/material.dart';
import 'package:assignment_2/pages/pokedex.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Pokedex(),
    },
  ));
}
