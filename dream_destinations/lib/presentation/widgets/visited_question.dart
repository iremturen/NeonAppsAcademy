import 'package:dream_destinations/constants/colors.dart';
import 'package:dream_destinations/constants/dimensions.dart';
import 'package:dream_destinations/presentation/models/custom_text_model.dart';
import 'package:dream_destinations/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class VisitedQuestion extends StatelessWidget {
  final bool hasVisited;
  final VoidCallback onYes;
  final VoidCallback onNo;

  const VisitedQuestion({
    super.key,
    required this.hasVisited,
    required this.onYes,
    required this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          model: CustomTextModel(
            text: 'Have you been to this place before?',
            fontSize: sectionTitleFontSize,
            fontWeight: FontWeight.bold,
            color: deepPurple,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onYes,
                style: ElevatedButton.styleFrom(
                  backgroundColor: hasVisited ? deepPurple : white,
                  foregroundColor: hasVisited ? white : deepPurple,
                ),
                child: CustomText(
                  model: CustomTextModel(
                    text: 'Yes',
                    fontSize: buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: hasVisited ? white : deepPurple,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: onNo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: !hasVisited ? deepPurple : white,
                  foregroundColor: !hasVisited ? white : deepPurple,
                ),
                child: CustomText(
                  model: CustomTextModel(
                    text: 'No',
                    fontSize: buttonTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: !hasVisited ? white : deepPurple,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}