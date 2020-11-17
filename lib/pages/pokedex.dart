import 'package:assignment_2/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final pokemons = List.generate(
      20,
      (index) => Padding(
            padding: EdgeInsets.all(7.5),
            child: Container(
              color: Colors.green,
              child: Text(
                'Pokemon $index',
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeef8ff),
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'Pokedex',
            style: TextStyle(
              color: Color(0xff222222),
              fontFamily: 'PF-Benchmark-Pro-Bold',
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Stack(children: <Widget>[
          GridView.count(
            padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 87.5),
            crossAxisCount: 2,
            children: pokemons,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SearchBar(),
          ),
        ]));
  }
}
