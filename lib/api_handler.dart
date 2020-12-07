import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

const HOST = "https://api.petfinder.com/v2";
const CLIENT_ID = "8n5zMTRe2clOwwtsDZyHjWpTuaCuiMIwzrn0GS9DUTpQKWbVx3";
const CLIENT_SECRET = "q3akGs0YYEeE2fNjvmu6Tirs3vFqVGt4AneiQv6G";

// SINGLETON
class APIHandler {
  static final APIHandler _apiHandler = APIHandler._internal();

  factory APIHandler() {
    return _apiHandler;
  }

  APIHandler._internal();

  final storage = new FlutterSecureStorage();

  Future<String> getToken({bool force = false}) async {
    dynamic token = await storage.read(key: 'token');

    if (token == null || force) {
      Response headerRes = await post('$HOST/oauth2/token', body: {
        'grant_type': 'client_credentials',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET
      });
      String token = convert.jsonDecode(headerRes.body)['access_token'];
      int expires = convert.jsonDecode(headerRes.body)['expires_in'];

      Timer(Duration(seconds: expires), () => getToken(force: true));

      await storage.write(key: 'token', value: token);

      return token;
    }

    return token;
  }

  Future<List<String>> getKinds() async {
    String token = await getToken(force: true);

    Response kindsRes =
        await get('$HOST/types', headers: {'Authorization': 'Bearer $token'});

    List<String> kinds = convert
        .jsonDecode(kindsRes.body)['types']
        .map<String>((dynamic kindRaw) => kindRaw['name'].toString())
        .toList();

    return kinds;
  }

  Future<List<String>> getBreeds({String type = 'Any'}) async {
    String token = await getToken();

    Response breedsRes = await get('$HOST/types/$type/breeds',
        headers: {'Authorization': 'Bearer $token'});

    List<String> breeds = convert
        .jsonDecode(breedsRes.body)['breeds']
        .map<String>((dynamic breedRaw) => breedRaw['name'].toString())
        .toList();

    return breeds;
  }
}
