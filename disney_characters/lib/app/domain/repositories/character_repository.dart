import '../entities/character_response_entity.dart';

abstract class CharacterRepository {
  Future<CharacterResponseEntity> getCharacters();
}