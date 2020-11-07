import 'package:flutter/material.dart';
import 'package:assignment_1/pages/login.dart';
import 'package:assignment_1/pages/sign_up.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Login(),
      '/sign-up': (context) => SignUp(),
    },
  ));
}
