import 'package:assignment_3/pet.dart';
import 'package:flutter/material.dart';

class ListItem extends ListTile {
  ListItem({Pet pet})
      : super(
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          leading: CircleAvatar(
            radius: 35,
            backgroundImage:
                pet.imgUrl != null ? NetworkImage(pet.imgUrl) : null,
            backgroundColor: Colors.deepPurple[100],
          ),
          title: Text(
            pet.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: pet.description != null ? Text(pet.description) : null,
        );
}
