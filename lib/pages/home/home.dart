import 'package:assignment_3/api_handler/api_handler_cached.dart';
import 'package:assignment_3/pet.dart';
import 'package:assignment_3/pages/home/filter/filter.dart';
import 'package:assignment_3/pages/home/list_item/list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = APIHandlerCached();

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
      backgroundColor: Colors.grey[100],
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
          padding: EdgeInsets.fromLTRB(15, 0, 15, 100),
          children: pets
              .map((pet) => ListItem(
                    pet: pet,
                    context: context,
                  ))
              .toList(),
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
