import 'package:harrys_challenge/common/constants/colors.dart';
import 'package:harrys_challenge/presentation/model/spell_model.dart';
import 'package:harrys_challenge/presentation/model/text_model.dart';

final spells = [
      SpellModel(
        textModel: TextModel(
          text: 'Lumos',
          fontSize: 24,
          color: gold,
        ),
        imagePath: 'assets/icons/lumos.png',
        color: gold,
        backgroundImageColor: gold,
      ),
      SpellModel(
        textModel: TextModel(
          text: 'Expelliarmus',
          fontSize: 12,
          color: purple,
        ),
        imagePath: 'assets/icons/expelliarmus.png',
        color: purple,
        backgroundImageColor: purple,
      ),
      SpellModel(
        textModel: TextModel(
          text: 'Incendio',
          fontSize: 14,
          color: tile,
        ),
        imagePath: 'assets/icons/incendio.png',
        color: tile,
        backgroundImageColor: tile,
      ),
      SpellModel(
        textModel: TextModel(
          text: 'Patronum',
          fontSize: 14,
          color: blue,
        ),
        imagePath: 'assets/icons/patronum.png',
        color: blue,
        backgroundImageColor: blue,
      ),
    ];