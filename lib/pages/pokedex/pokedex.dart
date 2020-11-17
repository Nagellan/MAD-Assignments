import 'package:assignment_2/pages/pokedex/app_bar.dart';
import 'package:assignment_2/pages/pokedex/grid.dart';
import 'package:assignment_2/pages/pokedex/search_bar.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  void handleSubmit(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef8ff),
      appBar: PokeAppBar(),
      body: Stack(children: <Widget>[
        Grid(pokemons: []),
        Align(
          alignment: Alignment.bottomCenter,
          child: SearchBar(handleSubmit: handleSubmit),
        ),
      ]),
    );
  }
}
