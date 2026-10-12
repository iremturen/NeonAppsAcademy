import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/presentation/models/custom_container_model.dart';
import 'package:laugh_house/presentation/models/custom_text_model.dart';
import 'package:laugh_house/presentation/widgets/custom_container.dart';
import 'package:laugh_house/presentation/widgets/custom_text.dart';
import 'package:laugh_house/presentation/widgets/custom_ticket_stepper.dart';

class CustomTicketOption extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const CustomTicketOption({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        color: AppColor.darkPurple,
        borderRadius: AppDimensions.borderRadius,
        border: Border.all(
          color: AppColor.white.withValues(alpha: AppDimensions.cardBorderOpacity),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.buttonHorizontalPadding, vertical: AppDimensions.buttonVerticalPadding),
      ),
      child: Row(
        spacing: AppDimensions.bigSpacing,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            model: CustomTextModel(
              text: 'Standard Ticket',
              fontSize: AppDimensions.mainSubtitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
              textAlign: TextAlign.left,
            ),
          ),
          CustomTicketStepper(
            quantity: quantity,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
