import 'package:assignment_3/pages/home/list_item/pet_image_cached.dart';
import 'package:assignment_3/pet.dart';
import 'package:flutter/material.dart';

class ListItem extends ListTile {
  ListItem({Pet pet})
      : super(
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          leading: PetImageCached(pet: pet),
          title: Text(
            pet.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: pet.description != null ? Text(pet.description) : null,
        );
}
