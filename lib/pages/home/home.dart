import 'package:assignment_3/api_handler.dart';
import 'package:assignment_3/pages/home/filter.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final api = new APIHandler();

  Home() {
    api.getToken();
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
          children: <Widget>[
            Text('Body'),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Filter(),
        ),
      ]),
    );
  }
}
