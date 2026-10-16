import '../entities/character_response_entity.dart';
import '../repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase({
    required this.repository,
  });

  Future<CharacterResponseEntity> call() {
    return repository.getCharacters();
  }
}