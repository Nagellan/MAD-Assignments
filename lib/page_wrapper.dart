import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  PageWrapper({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Card(
            color: Colors.white,
            child: this.child,
          ),
        ),
      ),
    );
  }
}
