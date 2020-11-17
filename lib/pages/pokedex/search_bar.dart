import 'file:///C:/Users/irekn/AndroidStudioProjects/MAD_Assignments/assignment_2/lib/pages/pokedex/search_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 15),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SearchField(),
        ),
      ),
    );
  }
}
