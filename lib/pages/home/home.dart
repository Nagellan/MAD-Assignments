import 'package:assignment_3/Pet.dart';
import 'package:assignment_3/api_handler.dart';
import 'package:assignment_3/pages/home/filter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = APIHandler();

  List<Pet> pets = [];

  _HomeState() {
    handleFilterChange();
  }

  void handleFilterChange({String kind, String breed}) async {
    List<Pet> _pets = await api.getPets(kind, breed);
    setState(() {
      this.pets = _pets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(101, 4, 181, 1),
        title: Image.asset(
          'assets/petfinder-logo.png',
          height: 30.0,
        ),
      ),
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.all(15),
          children: pets.map((pet) => Text(pet.name)).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Filter(
            onChange: handleFilterChange,
          ),
        ),
      ]),
    );
  }
}
