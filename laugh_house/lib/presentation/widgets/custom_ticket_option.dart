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
        color: darkPurple,
        borderRadius: borderRadius,
        border: Border.all(
          color: white.withValues(alpha: 0.25),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            model: CustomTextModel(
              text: 'Standard Ticket',
              fontSize: mainSubtitleFontSize,
              fontWeight: FontWeight.bold,
              color: white,
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
