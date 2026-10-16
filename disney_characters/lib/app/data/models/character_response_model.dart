import '../../domain/entities/character_response_entity.dart';
import '../../domain/entities/character_entity.dart';
import 'character_model.dart';

class CharacterResponseModel {
  final List<CharacterModel> characters;
  final int totalPages;

  const CharacterResponseModel({
    required this.characters,
    required this.totalPages,
  });

  factory CharacterResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final info = json['info'] as Map<String, dynamic>;
    final data = json['data'] as List<dynamic>;

    return CharacterResponseModel(
      characters: data
          .map(
            (character) => CharacterModel.fromJson(
              character as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalPages: info['totalPages'] as int,
    );
  }

  CharacterResponseEntity toEntity() {
    return CharacterResponseEntity(
      characters: characters
          .map<CharacterEntity>((character) => character)
          .toList(),
      totalPages: totalPages,
    );
  }
}