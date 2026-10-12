import 'package:flutter/material.dart';
import 'package:laugh_house/constants/colors.dart';
import 'package:laugh_house/constants/dimensions.dart';

class CustomTicketStepper extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;
  final int minQuantity;
  final int maxQuantity;

  const CustomTicketStepper({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.minQuantity = 1,
    this.maxQuantity = 10,
  });

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: quantity > minQuantity
                ? () => onChanged(quantity - 1)
                : null,
            icon: const Icon(Icons.remove),
            color: AppColor.neonGreen,
            disabledColor: AppColor.neonGreen,
          ),
          Text(
            '$quantity',
            style: const TextStyle(
              color: AppColor.neonGreen,
              fontSize: AppDimensions.cardTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: quantity < maxQuantity
                ? () => onChanged(quantity + 1)
                : null,
            icon: const Icon(Icons.add),
            color: AppColor.neonGreen,
          ),
        ],
    );
  }
}
