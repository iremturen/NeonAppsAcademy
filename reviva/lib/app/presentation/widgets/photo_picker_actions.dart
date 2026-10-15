import 'package:flutter/material.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_button.dart';
import 'package:reviva/app/presentation/models/custom_button_model.dart';

class PhotoPickerActions extends StatelessWidget {
  final VoidCallback onChoosePhoto;
  final VoidCallback onTakePhoto;
  final Color color;

  const PhotoPickerActions({
    super.key,
    required this.onChoosePhoto,
    required this.onTakePhoto,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimensions.spacingSmall,
      children: [
        Expanded(
          child: CustomButton(
            model: CustomButtonModel(
              text: AppStrings.choosePhotoButtonText,
              onPressed: onChoosePhoto,
              backgroundColor: color,
              textColor: AppColors.white,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.medium,
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            model: CustomButtonModel(
              text: AppStrings.takePhotoButtonText,
              onPressed: onTakePhoto,
              backgroundColor: color,
              textColor: AppColors.white,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.medium,
            ),
          ),
        ),
      ],
    );
  }
}
