import 'package:flutter/material.dart';
import 'package:assignment_2/pages/pokedex/grid.dart';
import 'package:assignment_2/pages/pokedex/app_bar.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeef8ff),
        appBar: PokeAppBar(),
        body: Grid(pokemons: []),
    );
  }
}
