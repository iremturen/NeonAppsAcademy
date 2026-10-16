import 'character_entity.dart';

class CharacterResponseEntity {
  final List<CharacterEntity> characters;
  final int totalPages;

  const CharacterResponseEntity({
    required this.characters,
    required this.totalPages,
  });
}