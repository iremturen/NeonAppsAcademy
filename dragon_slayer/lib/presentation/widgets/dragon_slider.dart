import 'package:dragon_slayer/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DragonSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const DragonSlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/green_dragon.png', width: 60, height: 60),

        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 25,

              thumbColor: softBlue,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),

              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,

              overlayColor: softBlue.withValues(alpha: 0.2),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2.5),
                    gradient: const LinearGradient(
                      colors: [softGreen, softYellow, softOrange, softRed],
                    ),
                  ),
                ),

                Slider(
                  value: value,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),

        Image.asset('assets/images/red_dragon.png', width: 60, height: 60),
      ],
    );
  }
}
