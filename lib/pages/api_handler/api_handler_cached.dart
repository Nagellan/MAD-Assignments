import 'package:assignment_3/pet.dart';
import 'api_handler.dart';
import 'api_handler_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// PROXY SINGLETON
class APIHandlerCached implements APIHandlerInterface {
  final api = APIHandler();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final APIHandlerCached _apiHandlerCached =
      APIHandlerCached._internal();

  factory APIHandlerCached() {
    return _apiHandlerCached;
  }

  APIHandlerCached._internal();

  @override
  Future<List<String>> getBreeds({String kind = 'Any'}) {
    return api.getBreeds(kind: kind);
  }

  @override
  Future<List<String>> getKinds() {
    return api.getKinds();
  }

  @override
  Future<List<Pet>> getPets(String kind, String breed) {
    return api.getPets(kind, breed);
  }
}
