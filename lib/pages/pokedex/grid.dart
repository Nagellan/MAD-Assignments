import 'package:assignment_2/pages/pokemon_full.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final List<String> pokemons;

  Grid({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 87.5),
      crossAxisCount: 2,
      children: pokemons
          .map((url) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonFull(url: url),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.network(url),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
