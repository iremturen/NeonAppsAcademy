import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/colors.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';
import 'package:hero_game/app/common/constants/direction.dart';
import 'package:hero_game/app/common/constants/direction_icon.dart';
import 'package:hero_game/app/common/widgets/custom_container.dart';
import 'package:hero_game/app/presentation/models/custom_container_model.dart';

class DirectionButton extends StatelessWidget {
  final Direction direction;
  final VoidCallback? onPressed;
  final double size;

  const DirectionButton({
    super.key,
    required this.direction,
    required this.onPressed,
    this.size = AppDimensions.directionButtonSize,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null
          ? AppDimensions.directionButtonEnabledOpacity
          : AppDimensions.directionButtonDisabledOpacity,
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: CustomContainer(
          model: CustomContainerModel(
            width: size,
            height: size,
            color: AppColor.lightBlue,
            borderRadius: AppDimensions.directionButtonBorderRadius,
          ),
          child: Center(
            child: Icon(
              direction.icon,
              color: AppColor.darkBlue,
              size: AppDimensions.directionButtonIconSize,
            ),
          ),
        ),
      ),
    );
  }
}
