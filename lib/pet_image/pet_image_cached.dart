import 'package:assignment_3/pet_image/pet_image.dart';
import 'package:assignment_3/pages/home/list_item/progress.dart';
import 'package:assignment_3/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PetImageCached extends StatelessWidget {
  final Pet pet;
  final double radius;

  PetImageCached({this.pet, this.radius});

  @override
  Widget build(BuildContext context) {
    return pet.imgUrl == null
        ? PetImage(
            radius: radius,
            child: Icon(
              Icons.pets,
              color: Colors.white,
            ),
          )
        : CachedNetworkImage(
            imageUrl: pet.imgUrl,
            imageBuilder: (context, imageProvider) => PetImage(
              radius: radius,
              image: imageProvider,
            ),
            placeholder: (context, url) => PetImage(
              radius: radius,
              child: Progress(),
            ),
            errorWidget: (context, url, error) => PetImage(
              radius: radius,
              child: Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
          );
  }
}
