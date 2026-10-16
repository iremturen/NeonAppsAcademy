import '../../domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.films,
    required super.shortFilms,
    required super.tvShows,
    required super.videoGames,
    required super.parkAttractions,
    required super.allies,
    required super.enemies,
    required super.url,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['_id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      films: List<String>.from(json['films'] ?? []),
      shortFilms: List<String>.from(json['shortFilms'] ?? []),
      tvShows: List<String>.from(json['tvShows'] ?? []),
      videoGames: List<String>.from(json['videoGames'] ?? []),
      parkAttractions:
          List<String>.from(json['parkAttractions'] ?? []),
      allies: List<String>.from(json['allies'] ?? []),
      enemies: List<String>.from(json['enemies'] ?? []),
      url: json['url'] as String,
    );
  }
}