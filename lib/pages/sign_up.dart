import 'package:assignment_1/auth_form.dart';
import 'package:assignment_1/page_wrapper.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      title: 'SignUp page',
      child: AuthForm(
        btnText: 'Sign up',
        formKey: signUpFormKey,
        onAuthSuccess: () {
          // TODO: remove print
          print('SIGN UP SUCCESS');
        },
        onAuthFailure: () {
          // TODO: remove print
          print('SIGN UP INCORRECT');
        },
      ),
    );
  }
}
