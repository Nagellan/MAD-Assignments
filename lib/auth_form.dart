import 'package:assignment_1/colors.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  GlobalKey<FormState> formKey;
  String btnText;
  Function onAuthSuccess;
  Function onAuthFailure;

  AuthForm(
      {this.formKey, this.btnText, this.onAuthSuccess, this.onAuthFailure});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.formKey.currentState.validate()) {
                widget.onAuthSuccess();
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
