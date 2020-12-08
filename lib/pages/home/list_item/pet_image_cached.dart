import 'package:assignment_3/pages/home/list_item/pet_image.dart';
import 'package:assignment_3/pages/home/list_item/progress.dart';
import 'package:assignment_3/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PetImageCached extends StatelessWidget {
  final Pet pet;

  PetImageCached({this.pet});

  @override
  Widget build(BuildContext context) {
    return pet.imgUrl == null
        ? PetImage(
            child: Icon(
              Icons.pets,
              color: Colors.white,
            ),
          )
        : CachedNetworkImage(
            imageUrl: pet.imgUrl,
            imageBuilder: (context, imageProvider) => PetImage(
              image: imageProvider,
            ),
            placeholder: (context, url) => PetImage(
              child: Progress(),
            ),
            errorWidget: (context, url, error) => PetImage(
              child: Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
          );
  }
}
