import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  PageWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Card(
          color: Colors.white,
          child: this.child,
        ),
      ),
    );
  }
}
