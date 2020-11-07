import 'package:assignment_1/colors.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  GlobalKey<FormState> formKey;
  String btnText;
  Function(String login, String password) onAuthSuccess;
  Function onAuthFailure;

  AuthForm(
      {this.formKey, this.btnText, this.onAuthSuccess, this.onAuthFailure});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final login = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    login.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Login',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please fill this field';
              }
              return null;
            },
            controller: login,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please fill this field';
              }
              if (value.length < 8) {
                return 'Password must have at least 8 letters';
              }
              return null;
            },
            controller: password,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.formKey.currentState.validate()) {
                widget.onAuthSuccess(login.text, password.text);
              } else {
                widget.onAuthFailure();
              }
            },
            child: Text(widget.btnText),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.PRIMARY_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
