import 'package:flutter/material.dart';

import '../models/custom_text_model.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.model});

  final CustomTextModel model;

  @override
  Widget build(BuildContext context) {
    return Text(
      model.text,
      style: TextStyle(
        fontSize: model.fontSize,
        fontWeight: model.fontWeight,
        color: model.color,
      ),
      textAlign: model.textAlign,
    );
  }
}
