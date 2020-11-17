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
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Pokemon',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
