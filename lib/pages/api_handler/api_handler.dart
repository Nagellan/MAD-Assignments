import 'dart:async';
import 'dart:convert' as convert;

import 'package:assignment_3/pet.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

import 'api_handler_interface.dart';

const HOST = "https://api.petfinder.com/v2";
const CLIENT_ID = "8n5zMTRe2clOwwtsDZyHjWpTuaCuiMIwzrn0GS9DUTpQKWbVx3";
const CLIENT_SECRET = "q3akGs0YYEeE2fNjvmu6Tirs3vFqVGt4AneiQv6G";

// SINGLETON
class APIHandler implements APIHandlerInterface {
  static final APIHandler _apiHandler = APIHandler._internal();

  factory APIHandler() {
    return _apiHandler;
  }

  APIHandler._internal();

  final storage = new FlutterSecureStorage();

  Future<String> _getToken({bool force = false}) async {
    dynamic token = await storage.read(key: 'token');

    if (token == null || force) {
      Response headerRes = await post('$HOST/oauth2/token', body: {
        'grant_type': 'client_credentials',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET
      });
      String token = convert.jsonDecode(headerRes.body)['access_token'];
      int expires = convert.jsonDecode(headerRes.body)['expires_in'];

      Timer(Duration(seconds: expires), () => _getToken(force: true));

      await storage.write(key: 'token', value: token);

      return token;
    }

    return token;
  }

  Future<List<String>> getKinds() async {
    try {
      // TODO: fix force getting token - it should be updated only on expiration
      String token = await _getToken(force: true);

      Response kindsRes =
          await get('$HOST/types', headers: {'Authorization': 'Bearer $token'});

      List<String> kinds = convert
          .jsonDecode(kindsRes.body)['types']
          .map<String>((dynamic kindRaw) => kindRaw['name'].toString())
          .toList();

      return kinds;
    } catch (error) {
      print('ERROR in getKinds: $error');
      return [];
    }
  }

  Future<List<String>> getBreeds({String kind = 'Any'}) async {
    try {
      // TODO: fix force getting token - it should be updated only on expiration
      String token = await _getToken(force: true);

      Response breedsRes = await get('$HOST/types/$kind/breeds',
          headers: {'Authorization': 'Bearer $token'});

      List<String> breeds = convert
          .jsonDecode(breedsRes.body)['breeds']
          .map<String>((dynamic breedRaw) => breedRaw['name'].toString())
          .toList();

      return breeds;
    } catch (error) {
      print('ERROR in getBreeds: $error');
      return [];
    }
  }

  Future<List<Pet>> getPets(String kind, String breed) async {
    try {
      // TODO: fix force getting token - it should be updated only on expiration
      String token = await _getToken(force: true);

      Map<String, String> queryParams = {
        'type': kind == 'Any' ? null : kind,
        'breed': breed == 'Any' ? null : breed,
      };
      String queryString = Uri(queryParameters: queryParams).query;

      Response petsRes = await get('$HOST/animals?$queryString',
          headers: {'Authorization': 'Bearer $token'});

      print(petsRes.body);

      List<Pet> pets = convert
          .jsonDecode(petsRes.body)['animals']
          .map<Pet>((dynamic petsRaw) => new Pet(
                id: petsRaw['id'],
                name: petsRaw['name'],
                size: petsRaw['size'],
                gender: petsRaw['gender'],
                description: petsRaw['description'],
                imgUrl: petsRaw['photos'].length == 0
                    ? null
                    : petsRaw['photos'][0]['small'],
              ))
          .toList();

      return pets;
    } catch (error) {
      print('ERROR in getPets: $error');
      return [];
    }
  }
}
