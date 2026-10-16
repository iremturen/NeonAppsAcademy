import '../../data/datasources/character_remote_datasource.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/usecases/get_characters_usecase.dart';
import '../../presentation/blocs/cubits/characters_cubit.dart';

//cubit HTTP isteğini kendi içinde oluşturmaz
//her sınıf kendi sorumluluğunu yerine getirir
class InjectionContainer {
  static CharactersCubit createCharactersCubit() {
    final remoteDataSource = CharacterRemoteDataSource();

    final CharacterRepository repository = CharacterRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );

    final getCharactersUseCase = GetCharactersUseCase(
      repository: repository,
    );

    return CharactersCubit(
      getCharactersUseCase: getCharactersUseCase,
    );
  }
}