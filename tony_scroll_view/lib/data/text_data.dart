import 'package:tony_scroll_view/common/constants/colors.dart';
import 'package:tony_scroll_view/common/constants/dimensions.dart';

import '../presentation/model/text_model.dart';

const List<String> textData = [
  'Arc Reactor',
  'Iron Man Suit',
  'J.A.R.V.I.S.',
  'Repulsor',
  'Mark 50',
  'Flight System',
  'Nano Technology',
  'Target System',
];

final List<TextModel> textModels = textData
    .map(
      (text) => TextModel(
        text: text,
        fontSize: textFontSize,
        color: white,
      ),
    )
    .toList();
