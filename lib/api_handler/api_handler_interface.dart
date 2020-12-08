import 'package:assignment_3/pet.dart';

abstract class APIHandlerInterface {
  Future<List<String>> getKinds();

  Future<List<String>> getBreeds({String kind = 'Any'});

  Future<List<Pet>> getPets(String kind, String breed);
}