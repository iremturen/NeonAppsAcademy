import 'package:flutter/material.dart';

import 'package:future_tech/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 1.4,
      scaleY: 1.4,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: green,
        activeTrackColor: green.withValues(alpha: 0.3),
        inactiveThumbColor: Colors.white54,
        inactiveTrackColor: Colors.white12,
      ),
    );
  }
}
