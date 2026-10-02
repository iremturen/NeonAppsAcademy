import 'package:flutter/material.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/presentation/models/custom_container_model.dart';
import 'package:picker_challenge/presentation/models/custom_text_model.dart';
import 'package:picker_challenge/presentation/widgets/custom_container.dart';
import 'package:picker_challenge/presentation/widgets/custom_text.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';

class ColorPickerView extends StatelessWidget {
  final UserModel user;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerView({
    super.key,
    required this.user,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [blue, green, orange, red, purple, pink, cyan, yellow];
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'Choose a Color',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: user.fontFamily,
            ),
          ),

          CustomText(
            model: CustomTextModel(
              text: 'Select a color for your background',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: user.fontFamily,
            ),
          ),

          const SizedBox(height: 60),

          CustomContainer(
            model: CustomContainerModel(
              width: screenWidth * 0.85,
              height: 180,
              color: white.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 36,
                runSpacing: 16,
                children: colors.map((color) {
                  final isSelected = color == user.color;

                  return GestureDetector(
                    onTap: () => onColorChanged(color),
                    child: CustomContainer(
                      model: CustomContainerModel(
                        width: colorBtnWidth,
                        height: colorBtnHeight,
                        color: color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(
                          colorBtnBorderRadius,
                        ),
                        border: isSelected
                            ? Border.all(
                                color: lightGrey,
                                width: colorBtnBorder,
                              )
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),        ],
      ),
    );
  }
}
