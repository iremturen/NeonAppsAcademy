import 'package:flutter/material.dart';
import 'package:picker_challenge/presentation/pages/color_picker_view.dart';
import 'package:picker_challenge/presentation/pages/date_picker_view.dart';
import 'package:picker_challenge/presentation/pages/font_picker_view.dart';
import 'package:picker_challenge/presentation/pages/photo_picker_view.dart';
import 'package:picker_challenge/presentation/widgets/profile_header.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';

class PageNavigation {
  const PageNavigation._();

  static Widget buildPage({
    required int selectedIndex,
    required UserModel user,
    required ValueChanged<Color> onColorChanged,
    required ValueChanged<String> onFontChanged,
    required ValueChanged<ImageProvider> onImageChanged,
    required VoidCallback onAgeChanged,
  }) {
    switch (selectedIndex) {
      case 1:
        return PhotoPickerView(model: user, onImageChanged: onImageChanged,);

      case 2:
        return FontPickerView(
          color: user.color,
          selectedFont: user.fontFamily,
          onFontChanged: onFontChanged,
        );

      case 3:
        return DatePickerView(user: user, onAgeChanged: onAgeChanged,);

      case 4:
        return ColorPickerView(user: user, onColorChanged: onColorChanged);

      default:
        return ProfileHeader(user: user);
    }
  }
}
