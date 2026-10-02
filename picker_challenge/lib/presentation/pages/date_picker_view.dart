import 'package:flutter/material.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/presentation/models/custom_container_model.dart';
import 'package:picker_challenge/presentation/models/custom_text_model.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';
import 'package:picker_challenge/presentation/widgets/custom_container.dart';
import 'package:picker_challenge/presentation/widgets/custom_text.dart';

class DatePickerView extends StatelessWidget {
  final UserModel user;
  final VoidCallback onAgeChanged;

  const DatePickerView({
    super.key,
    required this.user,
    required this.onAgeChanged,
  });

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) return;

    final today = DateTime.now();

    int age = today.year - selectedDate.year;

    if (today.month < selectedDate.month ||
        (today.month == selectedDate.month && today.day < selectedDate.day)) {
      age--;
    }

    user.age = age;

    onAgeChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'Choose Your Age',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: user.fontFamily,
            ),
          ),
          const SizedBox(height: 8),
          CustomText(
            model: CustomTextModel(
              text: 'Select your birth date',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: user.fontFamily,
            ),
          ),
          const SizedBox(height: 24),

          GestureDetector(
            onTap: () => selectDate(context),
            child: CustomContainer(
              model: CustomContainerModel(
                width: fontBtnWidth,
                height: pickDateContainer,
                color: grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: grey,
                      size: pickDateIconSize,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      model: CustomTextModel(
                        text: 'Select Birth Date',
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: grey,
                        fontFamily: user.fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
