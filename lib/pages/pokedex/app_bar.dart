import 'package:flutter/material.dart';

class PokeAppBar extends AppBar {
  PokeAppBar()
      : super(
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
  );
}
