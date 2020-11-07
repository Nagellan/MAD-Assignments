import 'package:assignment_1/page_wrapper.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String login;
  final String password;

  Profile({this.login, this.password});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: 'Profile',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Login: $login'),
          Text('Password: $password'),
        ],
      ),
    );
  }
}
