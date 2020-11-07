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
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: loginFormKey,
              child: Column(
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
                        if (loginFormKey.currentState.validate()) {
                          // TODO: remove print
                          print('LOGIN SUCCESS');
                        } else {
                          // TODO: remove print
                          print('LOGIN INCORRECT');
                        }
                      },
                      child: Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
