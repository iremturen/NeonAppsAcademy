import 'package:flutter/material.dart';
import 'package:neon_segmented_control/common/constants/colors.dart';
import 'package:neon_segmented_control/data/model/custom_container_model.dart';
import 'package:neon_segmented_control/data/model/segmented_control_model.dart';
import 'package:neon_segmented_control/presentation/widgets/custom_container.dart';
import 'package:neon_segmented_control/presentation/widgets/segmented_control.dart';
class SegmentControllerContainer extends StatelessWidget {
  const SegmentControllerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      model: CustomContainerModel(
        width: 360,
        height: 72,
        backgroundColor: darkBlue.withValues(alpha: 0.35),
        borderRadius: 32,
        borderColor: white.withValues(alpha: 0.2),
        borderWidth: 1,
        blur: 12,
        shadowColor: darkBlue.withValues(alpha: 0.3),
        shadowBlur: 20,
        shadowOffset: Offset.zero,
        padding: const EdgeInsets.all(6),
      ),
      child: SegmentedControl(
        segments: [
          SegmentedControlModel(
            title: 'Neon Academy 2023',
            backgroundColor: neonGreen,
            textColor: darkBlue,
            borderRadius: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
            borderColor: neonGreen,
            borderWidth: 1.5,
            shadowColor: neonGreen.withValues(alpha: 0.5),
            shadowBlur: 14,
          ),
          SegmentedControlModel(
            title: 'Neon',
            backgroundColor: lightBlue,
            textColor: darkBlue,
            borderRadius: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            borderColor: neonGreen,
            borderWidth: 1.5,
            shadowColor: neonGreen.withValues(alpha: 0.5),
            shadowBlur: 14,
          ),
          SegmentedControlModel(
            title: 'Apps',
            backgroundColor: segments,
            textColor: white,
            borderRadius: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            borderColor: neonGreen,
            borderWidth: 1.5,
            shadowColor: neonGreen.withValues(alpha: 0.5),
            shadowBlur: 14,
          ),
        ],
      ),
    );
  }
}