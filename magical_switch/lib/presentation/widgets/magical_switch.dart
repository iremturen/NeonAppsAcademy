import 'package:flutter/material.dart';
import '../../core/constants/color.dart';

class MagicalSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MagicalSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2.0,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: magicRed,
        inactiveTrackColor: magicGreen,
        thumbColor: const WidgetStatePropertyAll(darkGreen),
        trackOutlineColor: const WidgetStatePropertyAll(darkGreen),
        trackOutlineWidth: const WidgetStatePropertyAll(2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
