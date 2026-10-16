import '../../../domain/entities/character_entity.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<CharacterEntity> characters;
  final int totalPages;

  CharactersSuccess({
    required this.characters,
    required this.totalPages,
  });
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});
}