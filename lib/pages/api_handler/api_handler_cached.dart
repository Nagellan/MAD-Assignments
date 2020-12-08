import 'package:assignment_3/pet.dart';
import 'api_handler.dart';
import 'api_handler_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// PROXY SINGLETON
class APIHandlerCached implements APIHandlerInterface {
  final api = APIHandler();

  final _kinds = _firestore.collection('kinds');
  final _breeds = _firestore.collection('breeds');
  final _pets = _firestore.collection('pets');

  static final APIHandlerCached _apiHandlerCached =
      APIHandlerCached._internal();

  factory APIHandlerCached() {
    return _apiHandlerCached;
  }

  APIHandlerCached._internal();

  @override
  Future<List<String>> getBreeds({String kind = 'Any'}) async {
    try {
      List<String> breeds = await api.getBreedsUnsafe(kind: kind);
      _breeds.doc(kind).set({'breeds': breeds});
      return breeds;
    } catch (error) {
      return _breeds.doc(kind).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          return new Future.value(documentSnapshot.data()['breeds']);
        }
        return new Future.value([]);
      });
    }
  }

  @override
  Future<List<String>> getKinds() async {
    try {
      List<String> kinds = await api.getKindsUnsafe();
      _kinds.doc('kinds').set({'kinds': kinds});
      return kinds;
    } catch (error) {
      return _kinds
          .doc('kinds')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          return new Future.value(documentSnapshot.data()['kinds']);
        }
        return new Future.value([]);
      });
    }
  }

  @override
  Future<List<Pet>> getPets(String kind, String breed) async {
    try {
      List<Pet> pets = await api.getPetsUnsafe(kind, breed);
      _pets.doc('$kind-$breed').set(Map.fromIterable(pets,
          key: (pet) => pet.id.toString(), value: (pet) => pet.toMap()));
      return pets;
    } catch (error) {
      return _pets
          .doc('$kind-$breed')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          return new Future.value(documentSnapshot
              .data()
              .entries
              .map((e) => new Pet().byObject(e.value))
              .toList());
        }
        return new Future.value([]);
      });
    }
  }
}
