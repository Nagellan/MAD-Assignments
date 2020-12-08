import 'package:flutter/material.dart';

class Progress extends SizedBox {
  Progress()
      : super(
    height: 24,
    width: 24,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),
  );
}