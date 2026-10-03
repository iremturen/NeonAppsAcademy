import 'package:flutter/material.dart';
import 'package:titanic_passengers/constants/colors.dart';
import 'package:titanic_passengers/constants/dimensions.dart';
import 'package:titanic_passengers/presentation/models/custom_text_model.dart';
import 'package:titanic_passengers/presentation/widgets/custom_text.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomText(
        model: TextModel(
          text: '$label: $value',
          fontSize: subtitleFontSize,
          color: blue,
        ),
      ),
    );
  }
}