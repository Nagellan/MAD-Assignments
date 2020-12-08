import 'package:assignment_3/pet.dart';
import 'api_handler.dart';
import 'api_handler_interface.dart';

// PROXY
class APIHandlerCached implements APIHandlerInterface {
  final api = APIHandler();

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
