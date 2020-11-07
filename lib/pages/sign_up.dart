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

  Future<Function> handleSignUpSuccess(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(login, password);
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: 'SignUp page',
      child: AuthForm(
        btnText: 'Sign up',
        formKey: signUpFormKey,
        onAuthSuccess: handleSignUpSuccess,
      ),
    );
  }
}
