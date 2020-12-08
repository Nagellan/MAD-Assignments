import 'package:assignment_3/pages/home/list_item/pet_image_cached.dart';
import 'package:assignment_3/pages/pet_profile/profile_field.dart';
import 'package:assignment_3/pet.dart';
import 'package:flutter/material.dart';

class PetProfile extends StatelessWidget {
  final Pet pet;

  PetProfile({this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(101, 4, 181, 1),
        title: Text(pet.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: PetImageCached(
              pet: pet,
              radius: 80,
            ),
          ),
          ProfileField(
            label: 'Name',
            value: pet.name,
          ),
          ProfileField(
            label: 'Gender',
            value: pet.gender,
          ),
          ProfileField(
            label: 'Size',
            value: pet.size,
          ),
          ProfileField(
            label: 'Description',
            value: pet.description,
          )
        ],
      ),
    );
  }
}
