import 'dart:convert' as convert;

import 'package:assignment_2/pages/pokedex/app_bar.dart';
import 'package:assignment_2/pages/pokedex/grid.dart';
import 'package:assignment_2/pages/pokedex/search_bar.dart';
import 'package:assignment_2/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  List<Pokemon> pokemons = [];

  void handleSubmit(String text) async {
    setState(() {
      pokemons = [];
    });

    Response pokemonSpeciesRes =
        await get('https://pokeapi.co/api/v2/pokemon/$text');
    if (pokemonSpeciesRes.statusCode == 200) {
      var pokemon = convert.jsonDecode(pokemonSpeciesRes.body);
      var sprites = pokemon['sprites'];
      List<dynamic> imgUrls = [
        sprites['back_default'],
        sprites['back_female'],
        sprites['back_shiny'],
        sprites['back_shiny_female'],
        sprites['front_default'],
        sprites['front_female'],
        sprites['front_shiny'],
        sprites['front_shiny_female'],
      ];
      imgUrls.forEach((url) {
        if (url != null) {
          setState(() {
            pokemons.add(new Pokemon(name: pokemon['name'], img: url));
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef8ff),
      appBar: PokeAppBar(text: 'Pokedex'),
      body: Stack(children: <Widget>[
        Grid(pokemons: pokemons),
        Align(
          alignment: Alignment.bottomCenter,
          child: SearchBar(handleSubmit: handleSubmit),
        ),
      ]),
    );
  }
}
