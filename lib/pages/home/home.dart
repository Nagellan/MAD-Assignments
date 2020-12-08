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
              .map((pet) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          pet.imgUrl != null ? NetworkImage(pet.imgUrl) : null,
                      backgroundColor: Colors.deepPurple[100],
                    ),
                    title: Text(
                      pet.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle:
                        pet.description != null ? Text(pet.description) : null,
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
