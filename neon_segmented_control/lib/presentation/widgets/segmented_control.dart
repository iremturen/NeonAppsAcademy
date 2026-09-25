import 'package:flutter/material.dart';

import 'package:neon_segmented_control/common/constants/colors.dart';
import 'package:neon_segmented_control/data/model/custom_container_model.dart';
import 'package:neon_segmented_control/data/model/custom_text_model.dart';
import 'package:neon_segmented_control/data/model/segmented_control_model.dart';

import 'package:neon_segmented_control/presentation/widgets/custom_container.dart';
import 'package:neon_segmented_control/presentation/widgets/custom_text.dart';

class SegmentedControl extends StatefulWidget {
  final List<SegmentedControlModel> segments;

  const SegmentedControl({
    super.key,
    required this.segments,
  });

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<double> segmentWidths = selectedIndex == 0
        ? [190, 75, 75]
        : selectedIndex == 1
            ? [105, 95, 65]
            : [95, 75, 75];

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.segments.length,
          (index) {
            final segment = widget.segments[index];
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: segmentWidths[index],
                child: CustomContainer(
                  model: CustomContainerModel(
                    width: segmentWidths[index],
                    height: 50,
                    backgroundColor: isSelected
                        ? neonGreen
                        : segments.withValues(alpha: 0.25),
                    borderRadius: segment.borderRadius,
                    borderColor: neonGreen,
                    borderWidth: segment.borderWidth,
                    shadowColor: neonGreen.withValues(alpha: 0.5),
                    shadowBlur: segment.shadowBlur,
                    shadowOffset: segment.shadowOffset,
                    shadowSpread: segment.shadowSpread,
                    padding: segment.padding,
                    margin: segment.margin,
                  ),
                  child: Center(
                    child: CustomText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model: CustomTextModel(
                        text: segment.title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? darkBlue : white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
