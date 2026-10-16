import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_strings.dart';
import '../../../domain/usecases/get_characters_usecase.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharactersCubit({required this.getCharactersUseCase})
    : super(CharactersInitial());

  Future<void> fetchCharacters() async {
    emit(CharactersLoading());

    try {
      final response = await getCharactersUseCase();

      emit(
        CharactersSuccess(
          characters: response.characters,
          totalPages: response.totalPages,
        ),
      );
    } catch (error) {
      emit(
        CharactersError(message: AppStrings.charactersLoadingError),
      );
    }
  }
}
