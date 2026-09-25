import 'package:flutter/material.dart';
import 'package:neon_segmented_control/common/constants/colors.dart';
import 'package:neon_segmented_control/data/model/custom_container_model.dart';
import 'package:neon_segmented_control/data/model/custom_text_model.dart';
import 'package:neon_segmented_control/presentation/widgets/custom_container.dart';
import 'package:neon_segmented_control/presentation/widgets/custom_text.dart';
import 'package:neon_segmented_control/presentation/widgets/segment_controller_container.dart';

class SegmentedControlView extends StatefulWidget {
  const SegmentedControlView({super.key});

  @override
  State<SegmentedControlView> createState() => _SegmentedControlViewState();
}

class _SegmentedControlViewState extends State<SegmentedControlView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CustomContainer(
            model: CustomContainerModel(
              height: 220,
              width: 400,
              backgroundColor: darkBlue.withValues(alpha: 0.35),
              borderRadius: 28,
              blur: 15.0,
              borderColor: white.withValues(alpha: 0.12),
              borderWidth: 1.2,
              shadowColor: darkBlue.withValues(alpha: 0.4),
              shadowBlur: 35,
              shadowOffset: Offset.zero,
              shadowSpread: 1,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            ),
            child: Column(
              children: [
                CustomText(
                  model: CustomTextModel(
                    text: 'Segmented Control',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
                const SizedBox(height: 8),
                CustomText(
                  model: CustomTextModel(
                    text: 'The size varies depending on the selection',
                    fontSize: 14,
                    color: white.withValues(alpha: 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const SegmentControllerContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
