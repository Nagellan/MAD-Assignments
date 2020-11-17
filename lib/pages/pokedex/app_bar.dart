import 'package:flutter/material.dart';

class PokeAppBar extends AppBar {
  final String text;

  PokeAppBar({this.text})
      : super(
    toolbarHeight: 70,
    title: Text(
      text,
      style: TextStyle(
        color: Color(0xff222222),
        fontFamily: 'PF-Benchmark-Pro-Bold',
        fontSize: 25.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Color(0xff222222), //change your color here
    ),
  );
}
