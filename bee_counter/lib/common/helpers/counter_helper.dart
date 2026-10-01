import 'package:bee_counter/common/constants/dimensions.dart';

class CounterHelper {
  static const Duration duration = Duration(milliseconds: 100);
  static const Duration completeDelay = Duration(seconds: 1);

  static Future<void> startCounter({
    required Function(int) onCount,
    required Function() onComplete,
  }) async {
    for (int i = 0; i <= topCount; i++) {
      await Future.delayed(duration);

      onCount(i);
    }
    await Future.delayed(completeDelay);
    onComplete();
  }
}
