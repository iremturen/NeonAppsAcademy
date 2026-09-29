import 'package:bee_counter/common/constants/dimensions.dart';
import 'package:bee_counter/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CounterHelper {
  static const Duration duration = Duration(milliseconds: 100);

  static Color getCounterColor(int counter) {
    const colors = [
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

  static Future<void> startCounter({
    required Function(int) onCount,
    required Function() onComplete,
  }) async {
    for (int i = 0; i <= topCount; i++) {
      await Future.delayed(duration);

      onCount(i);
    }

    onComplete();
  }
}
