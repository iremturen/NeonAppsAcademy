import 'package:flutter/animation.dart';
import 'package:reviva/app/common/constants/dimensions.dart';

class PhotoEnhancementController {
  late final AnimationController animationController;

  double savedProgress = 0;
  bool isRunning = false;
  bool isCompleted = false;

  final TickerProvider vsync;
  final VoidCallback onUpdate;

  PhotoEnhancementController({required this.vsync, required this.onUpdate}) {
    animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: AppDimensions.animationDuration),
    )
      ..addListener(_updateProgress)
      ..addStatusListener(_handleAnimationStatus);
  }

  void _updateProgress() {
    onUpdate();
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      isRunning = false;
      isCompleted = true;
      savedProgress = 1;
      onUpdate();
    }
  }

  void startOrResume() {
    if (isRunning || isCompleted) return;
    if (animationController.duration == null) return;

    isRunning = true;
    onUpdate();

    animationController.forward(from: savedProgress);
  }

  void pause() {
    if (!isRunning) return;

    animationController.stop(canceled: false);
    savedProgress = animationController.value;
    isRunning = false;

    onUpdate();
  }

  void stop() {
    animationController.stop(canceled: false);
    animationController.reset();

    savedProgress = 0;
    isRunning = false;
    isCompleted = false;

    onUpdate();
  }

  double get progress => animationController.value;

  void dispose() {
    animationController
      ..removeListener(_updateProgress)
      ..removeStatusListener(_handleAnimationStatus)
      ..dispose();
  }
}
