import 'package:rickandmorty/data/remote/character_api.dart';
import 'package:rickandmorty/domain/entities/character.dart';

class CharacterRepository {
  
  Future<List<Character>> getCharacters() async {
    CharacterApi api = CharacterApi();
    return await api.getCharacters();
  }
}