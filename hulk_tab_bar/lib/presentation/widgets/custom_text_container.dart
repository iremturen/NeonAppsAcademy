import 'package:flutter/material.dart';
import 'package:hulk_tab_bar/presentation/models/custom_text_container_model.dart';
import 'package:hulk_tab_bar/presentation/widgets/custom_text.dart';

class CustomTextContainer extends StatelessWidget {
  final CustomTextContainerModel model;

  const CustomTextContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: model.padding,
      decoration: BoxDecoration(
        color: model.backgroundColor,
        borderRadius: model.borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(model: model.title),
          CustomText(model: model.subtitle),
        ],
      ),
    );
  }
}