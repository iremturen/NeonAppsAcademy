import 'package:flutter/material.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/data/font_items.dart';
import 'package:picker_challenge/presentation/models/custom_container_model.dart';
import 'package:picker_challenge/presentation/models/custom_text_model.dart';
import 'package:picker_challenge/presentation/widgets/custom_container.dart';
import 'package:picker_challenge/presentation/widgets/custom_text.dart';

class FontPickerView extends StatelessWidget {
  final Color color;
  final String selectedFont;
  final ValueChanged<String> onFontChanged;

  const FontPickerView({
    super.key,
    required this.color,
    required this.selectedFont,
    required this.onFontChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'Choose a Font Style',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: selectedFont,
            ),
          ),

          const SizedBox(height: 8),

          CustomText(
            model: CustomTextModel(
              text: 'Select a font style for your profile',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: selectedFont,
            ),
          ),

          const SizedBox(height: 36),

          ...fonts.map(
            (font) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () => onFontChanged(font),
                child: CustomContainer(
                  model: CustomContainerModel(
                    width: fontBtnWidth,
                    height: fontBtnHeight,
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: white.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: CustomText(
                      model: CustomTextModel(
                        text: font,
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: grey,
                        fontFamily: font,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}