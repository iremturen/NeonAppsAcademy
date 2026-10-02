import 'package:aladdin_progress/constants/colors.dart';
import 'package:aladdin_progress/constants/dimensions.dart';
import 'package:aladdin_progress/presentation/models/custom_button_model.dart';
import 'package:aladdin_progress/presentation/models/custom_container_model.dart';
import 'package:aladdin_progress/presentation/models/custom_progress_indicator_model.dart';
import 'package:aladdin_progress/presentation/models/custom_text_model.dart';
import 'package:aladdin_progress/presentation/widgets/custom_button.dart';
import 'package:aladdin_progress/presentation/widgets/custom_container.dart';
import 'package:aladdin_progress/presentation/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:aladdin_progress/presentation/widgets/custom_text.dart';

class AladdinProgressView extends StatefulWidget {
  const AladdinProgressView({super.key});

  @override
  State<AladdinProgressView> createState() => _AladdinProgressViewState();
}

class _AladdinProgressViewState extends State<AladdinProgressView> {
  int progress = minValue;

  void increaseProgress() {
    setState(() {
      if (progress == maxValue) {
        progress = minValue;
      } else {
        progress++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
              const SizedBox(height: 24),

              CustomText(
                model: CustomTextModel(
                  text: 'ALADDIN\'S JOURNEY',
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),

              const SizedBox(height: 8),

              CustomText(
                model: CustomTextModel(
                  text: 'Every step brings new knowledge.',
                  fontSize: subtitleFontSize,
                  color: white,
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),

              CustomContainer(
                model: CustomContainerModel(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: containerHeight,
                  color: darkBlue.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: blue, width: 2.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      model: CustomTextModel(
                        text: '$progress / $maxValue',
                        fontSize: progressFontSize,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomProgressIndicator(
                        model: CustomProgressIndicatorModel(
                          value:  progress / maxValue,
                          color: blue,
                          backgroundColor: darkBlue2,
                          minHeight: indicatorHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 44),

              CustomButton(
                model: CustomButtonModel(
                  text: 'I learned something new !',
                  onPressed: increaseProgress,
                  backgroundColor: blue,
                  width: buttonWidth,
                  height: buttonHeight,
                  borderRadius: buttonborderRadius,
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
