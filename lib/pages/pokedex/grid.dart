import 'package:assignment_2/pages/pokemon_full.dart';
import 'package:assignment_2/pokemon.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final List<Pokemon> pokemons;

  Grid({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(15, 7.5, 15, 87.5),
      crossAxisCount: 2,
      children: pokemons
          .map((pokemon) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonFull(url: pokemon.img, name: pokemon.name),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.network(pokemon.img),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
