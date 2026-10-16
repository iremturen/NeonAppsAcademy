import 'dart:convert';

import 'package:disney_characters/app/common/constants/app_strings.dart';
import 'package:http/http.dart' as http;

import '../models/character_response_model.dart';

class CharacterRemoteDataSource {
  static const String _baseUrl = 'https://api.disneyapi.dev/character';

  // RESTful API, kaynaklara URL ve HTTP(HyperText Transfer Protocol) metotlarıyla erişim sağlar.
  // Bu istek karakterleri GET ile alır ve JSON yanıtını modele dönüştürür.
  Future<CharacterResponseModel> getCharacters() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final jsonData =
          jsonDecode(response.body) as Map<String, dynamic>;
      return CharacterResponseModel.fromJson(jsonData);
    }

    throw Exception(
      '${AppStrings.charactersFetchHttpError}${response.statusCode}',
    );
  }
}
