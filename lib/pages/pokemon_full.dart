import 'package:flutter/material.dart';

class PokemonFull extends StatelessWidget {
  final String url;

  PokemonFull({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pokemon')),
        backgroundColor: Color(0xffeef8ff),
        body: Center(child: Image.network(url)));
  }
}
