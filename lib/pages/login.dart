import 'package:assignment_1/auth_form.dart';
import 'package:assignment_1/colors.dart';
import 'package:assignment_1/page_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: 'Login page',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AuthForm(
            btnText: 'Login',
            formKey: loginFormKey,
            onAuthSuccess: (login, password) {
              // TODO: remove print
              print('LOGIN SUCCESS $login: $password');
            },
            onAuthFailure: () {
              // TODO: remove print
              print('LOGIN INCORRECT');
            },
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text('First time here? Sign up'),
            textColor: AppColors.PRIMARY_COLOR_LIGHTER,
          ),
        ],
      ),
    );
  }
}
