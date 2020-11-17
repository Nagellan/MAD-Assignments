import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final List<String> pokemons;

  Grid({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 87.5),
      crossAxisCount: 2,
      children: pokemons.map((url) => Image.network(url)).toList(),
    );
  }
}
