class Pet {
  int id;
  String name;
  String gender;
  String size;
  String description;
  dynamic imgUrl;

  Pet({
    this.id,
    this.name,
    this.gender,
    this.size,
    this.description,
    this.imgUrl,
  });

  Pet byObject(dynamic pet) {
    id = pet.id;
    name = pet.name;
    gender = pet.gender;
    size = pet.size;
    description = pet.description;
    imgUrl = pet.imgUrl;

    return this;
  }

  Map<String, dynamic> toMap() {
    return new Map.from({
      'name': name,
      'gender': gender,
      'size': size,
      'description': description,
      'imgUrl': imgUrl,
    });
  }
}
