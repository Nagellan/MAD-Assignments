import 'dart:convert' as convert;

import 'package:assignment_2/pages/pokedex/app_bar.dart';
import 'package:assignment_2/pages/pokedex/grid.dart';
import 'package:assignment_2/pages/pokedex/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  List<String> pokemons = [];

  void addPokemonForms(var pokemonForms) {
    if (pokemonForms == null) return;
    pokemonForms.forEach((pokemonForm) {
      String pokemonName = pokemonForm['species']['name'];
      setState(() {
        pokemons.add(pokemonName);
      });
      addPokemonForms(pokemonForm['evolves_to']);
    });
  }

  void handleSubmit(String text) async {
    Response pokemonSpeciesRes =
    await get('https://pokeapi.co/api/v2/pokemon-species/$text');
    if (pokemonSpeciesRes.statusCode == 200) {
      var pokemonSpecies = convert.jsonDecode(pokemonSpeciesRes.body);
      String evolutionChainUrl = pokemonSpecies['evolution_chain']['url'];
      Response evolutionChainRes = await get(evolutionChainUrl);
      if (evolutionChainRes.statusCode == 200) {
        var evolutionChain = convert.jsonDecode(evolutionChainRes.body);
        addPokemonForms(evolutionChain['chain']['evolves_to']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef8ff),
      appBar: PokeAppBar(),
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
