import 'package:bee_counter/common/constants/colors.dart';
import 'package:bee_counter/common/constants/dimensions.dart';
import 'package:bee_counter/presentation/model/custom_container_model.dart';
import 'package:bee_counter/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final int counter;

  const CustomCircularProgressIndicator({
    super.key,
    required this.counter,
  });

  Color getColor() {
    final colors = [
      softYellow,
      softOrange,
      softRed,
      softGreen,
      softBlue,
      softPurple,
      softPink,
    ];

    return colors[(counter ~/ 10) % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        width: indicatorWidth,
        height: indicatorHeight,
        color: cream,
        borderRadius: BorderRadius.circular(indicatorWidth / 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: CircularProgressIndicator(
          value: counter / topCount,
          strokeWidth: 12,
          color: getColor(),
        ),
      ),
    );
  }
}
