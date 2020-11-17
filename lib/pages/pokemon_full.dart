import 'package:assignment_2/pages/pokedex/app_bar.dart';
import 'package:flutter/material.dart';

class PokemonFull extends StatelessWidget {
  final String url;
  final String name;

  PokemonFull({this.url, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PokeAppBar(
          text: name,
        ),
        backgroundColor: Color(0xffeef8ff),
        body: Center(child: Image.network(url, scale: 0.3)));
  }
}
