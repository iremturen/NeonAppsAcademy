import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';
import 'package:hero_game/app/common/constants/direction.dart';
import 'package:hero_game/app/presentation/widgets/direction_button.dart';

class DirectionPad extends StatelessWidget {
  final ValueChanged<Direction> onDirectionPressed;

  const DirectionPad({
    super.key,
    required this.onDirectionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DirectionButton(
          direction: Direction.up,
          onPressed: () => onDirectionPressed(Direction.up),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: AppDimensions.directionButtonSpacing,
          children: [
            DirectionButton(
              direction: Direction.left,
              onPressed: () => onDirectionPressed(Direction.left),
            ),
            DirectionButton(
              direction: Direction.right,
              onPressed: () => onDirectionPressed(Direction.right),
            ),
          ],
        ),
        DirectionButton(
          direction: Direction.down,
          onPressed: () => onDirectionPressed(Direction.down),
        ),
      ],
    );
  }
}
