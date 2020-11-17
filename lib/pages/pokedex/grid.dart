import 'file:///C:/Users/irekn/AndroidStudioProjects/MAD_Assignments/assignment_2/lib/pages/pokedex/search_bar.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final List<String> pokemons;

  Grid({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GridView.count(
        padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 87.5),
        crossAxisCount: 2,
        children: pokemons.map((name) => Card(child: Text(name))).toList(),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: SearchBar(),
      ),
    ]);
  }
}
