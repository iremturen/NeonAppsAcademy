import '../../domain/entities/character_response_entity.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<CharacterResponseEntity> getCharacters() async {
    final response = await remoteDataSource.getCharacters();

    return response.toEntity();
  }
}