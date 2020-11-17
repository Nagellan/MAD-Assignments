import 'package:flutter/material.dart';
import 'package:assignment_2/pages/pokedex/pokedex.dart';
import 'package:assignment_2/pages/pokemon_full.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Pokedex(),
      '/full': (context) => PokemonFull(),
    },
  ));
}
