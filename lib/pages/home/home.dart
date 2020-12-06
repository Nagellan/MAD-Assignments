import 'dart:convert' as convert;

import 'package:assignment_3/pages/home/filter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const HOST = "https://api.petfinder.com/v2";
const CLIENT_ID = "8n5zMTRe2clOwwtsDZyHjWpTuaCuiMIwzrn0GS9DUTpQKWbVx3";
const CLIENT_SECRET = "q3akGs0YYEeE2fNjvmu6Tirs3vFqVGt4AneiQv6G";

class Home extends StatelessWidget {
  Future<String> getToken() async {
    Response headerRes = await post('$HOST/oauth2/token', body: {
      'grant_type': 'client_credentials',
      'client_id': CLIENT_ID,
      'client_secret': CLIENT_SECRET
    });
    String token = convert.jsonDecode(headerRes.body)['access_token'];
    return token;
  }

  Home() {
    // getToken();
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
