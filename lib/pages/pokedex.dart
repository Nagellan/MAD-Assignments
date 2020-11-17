import 'package:assignment_2/search_bar.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef8ff),
      appBar: AppBar(
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
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SearchBar(),
      ),
    );
  }
}
