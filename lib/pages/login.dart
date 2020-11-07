import 'package:assignment_1/auth_form.dart';
import 'package:assignment_1/colors.dart';
import 'package:assignment_1/page_wrapper.dart';
import 'package:assignment_1/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();

  Future<Function> handleLoginSuccess(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoginSuccessful = prefs.getString(login) == password;
    if (isLoginSuccessful) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(login: login, password: password),
          ));
    } else {
      // TODO: remove print
      print('INCORRECT CREDENTIALS!!!');
    }
  }

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
            onAuthSuccess: handleLoginSuccess,
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
