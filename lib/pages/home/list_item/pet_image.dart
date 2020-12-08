import 'package:flutter/material.dart';

class PetImage extends CircleAvatar {
  PetImage({Widget child, ImageProvider<Object> image})
      : super(
    backgroundColor: Colors.deepPurple[100],
    radius: 35,
    child: child,
    backgroundImage: image,
  );
}