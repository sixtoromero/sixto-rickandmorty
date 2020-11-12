import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/managers/http_manager.dart';

class CharacterApi {

  final HttpManager httpManager = HttpManager();

  final String _url = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> getCharacters() async {
    //final resp = await http.get(_url);
    
    dynamic resp = await httpManager.get('character');
      
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    print(decodedData);

    final List<Character> characters = new List();

    if (decodedData == null) return [];
    
    dynamic result = decodedData['results'];

    result.forEach((value) {
      final itemTemp = Character.fromJson(value);
      characters.add(itemTemp);
    });

    print(characters);

    return characters;

  }
}