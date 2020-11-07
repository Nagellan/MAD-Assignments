import 'dart:async';

import 'package:assignment_1/auth_form.dart';
import 'package:assignment_1/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpFormKey = GlobalKey<FormState>();

  Future<Function> handleSignUp(
      String login, String password, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isNewUser = prefs.getString(login) == null;

    if (isNewUser) {
      prefs.setString(login, password);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('You successfully logged in!'),
          duration: Duration(seconds: 1),
        ),
      );
      Timer(Duration(milliseconds: 1800),
          () => {Navigator.pushNamed(context, '/')});
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('This user already exists!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: 'SignUp page',
      child: AuthForm(
        btnText: 'Sign up',
        formKey: signUpFormKey,
        onValidationSuccess: handleSignUp,
      ),
    );
  }
}
