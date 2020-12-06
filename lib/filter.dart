import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text('First'),
              ),
              Expanded(
                flex: 1,
                child: Text('Second'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
