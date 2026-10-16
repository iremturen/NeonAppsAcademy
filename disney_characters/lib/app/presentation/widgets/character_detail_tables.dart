import 'package:disney_characters/app/presentation/models/info_table_model.dart';

import '../../common/constants/app_strings.dart';
import '../../domain/entities/character_entity.dart';

class CharacterDetailTables {
  static InfoTableModel basicInformation(CharacterEntity character) {
    return InfoTableModel(
      title: AppStrings.basicInformation,
      items: [
        InfoTableItem(label: AppStrings.id, value: character.id.toString()),
        InfoTableItem(label: AppStrings.name, value: character.name),
        InfoTableItem(
          label: AppStrings.imageUrl,
          value: character.imageUrl ?? AppStrings.none,
        ),
        InfoTableItem(label: AppStrings.apiUrl, value: character.url),
      ],
    );
  }

  static InfoTableModel appearances(CharacterEntity character) {
    return InfoTableModel(
      title: AppStrings.appearances,
      items: [
        InfoTableItem(
          label: AppStrings.films,
          value: _formatList(character.films),
        ),
        InfoTableItem(
          label: AppStrings.shortFilms,
          value: _formatList(character.shortFilms),
        ),
        InfoTableItem(
          label: AppStrings.tvShows,
          value: _formatList(character.tvShows),
        ),
        InfoTableItem(
          label: AppStrings.videoGames,
          value: _formatList(character.videoGames),
        ),
        InfoTableItem(
          label: AppStrings.parkAttractions,
          value: _formatList(character.parkAttractions),
        ),
      ],
    );
  }

  static InfoTableModel relationships(CharacterEntity character) {
    return InfoTableModel(
      title: AppStrings.relationships,
      items: [
        InfoTableItem(
          label: AppStrings.allies,
          value: _formatList(character.allies),
        ),
        InfoTableItem(
          label: AppStrings.enemies,
          value: _formatList(character.enemies),
        ),
      ],
    );
  }

  static String _formatList(List<String> values) {
    return values.isEmpty ? AppStrings.none : values.join(', ');
  }
}
