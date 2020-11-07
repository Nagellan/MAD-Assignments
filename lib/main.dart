import 'package:flutter/material.dart';
import 'package:assignment_1/pages/login.dart';
import 'package:assignment_1/pages/sign_up.dart';
import 'package:assignment_1/pages/profile.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Login(),
      '/sign-up': (context) => SignUp(),
      '/profile': (context) => Profile(),
    },
  ));
}
