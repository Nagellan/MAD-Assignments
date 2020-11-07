import 'package:assignment_1/colors.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  GlobalKey<FormState> formKey;
  String btnText;
  Function(String login, String password, BuildContext context)
      onValidationSuccess;
  Function onValidationFailure;

  AuthForm(
      {this.formKey,
      this.btnText,
      this.onValidationSuccess,
      this.onValidationFailure});

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
          Builder(
              // Create an inner BuildContext so that the onPressed methods
              // can refer to the Scaffold with Scaffold.of().
              builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  widget.onValidationSuccess(
                      login.text, password.text, context);
                } else if (widget.onValidationFailure != null) {
                  widget.onValidationFailure();
                }
              },
              child: Text(widget.btnText),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.PRIMARY_COLOR),
              ),
            );
          }),
        ],
      ),
    );
  }
}
