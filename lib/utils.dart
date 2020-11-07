import 'package:flutter/material.dart';

void showError(String message, BuildContext context, [Duration duration]) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: <Widget>[
          Icon(Icons.error, color: Colors.red),
          SizedBox(width: 10),
          Text(message),
        ],
      ),
      duration: duration ?? Duration(seconds: 2),
    ),
  );
}

void showPrompt(String message, BuildContext context, [Duration duration]) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: <Widget>[
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 10),
          Text(message),
        ],
      ),
      duration: duration ?? Duration(seconds: 2),
    ),
  );
}
