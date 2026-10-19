import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/app_strings.dart';
import 'package:hero_game/app/common/constants/colors.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';
import 'package:hero_game/app/common/constants/direction.dart';
import 'package:hero_game/app/presentation/widgets/direction_pad.dart';
import 'package:hero_game/app/presentation/widgets/custom_background.dart';
import 'package:hero_game/app/presentation/widgets/maze_widget.dart';

class MazeView extends StatefulWidget {
  final int initialStep;
  final bool enableBackgroundHero;

  const MazeView({
    super.key,
    this.initialStep = 0,
    this.enableBackgroundHero = true,
  });

  @override
  State<MazeView> createState() => _MazeViewState();
}

class _MazeViewState extends State<MazeView> {
  late int currentStep;
  late bool _enableBackgroundHero;

  @override
  void initState() {
    super.initState();
    currentStep = widget.initialStep;
    _enableBackgroundHero = widget.enableBackgroundHero;

    if (currentStep == mazePath.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showMessage(
            AppStrings.mazeSuccessMessage,
            onDismiss: () => _replaceWithStep(0),
          );
        }
      });
    }
  }

  void _onDirectionPressed(Direction direction) {
    if (currentStep >= mazePath.length) return;

    if (direction != mazePath[currentStep]) {
      _showMessage(AppStrings.mazeFailureMessage);
      return;
    }

    final nextStep = currentStep + 1;
    if (_enableBackgroundHero) {
      setState(() => _enableBackgroundHero = false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _replaceWithStep(nextStep);
      });
      return;
    }

    _replaceWithStep(nextStep);
  }

  void _replaceWithStep(int step) {
    Navigator.of(context).pushReplacement<void, void>(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(
          milliseconds: AppDimensions.mazePlayerAnimationDurationMs,
        ),
        reverseTransitionDuration: const Duration(
          milliseconds: AppDimensions.mazePlayerAnimationDurationMs,
        ),
        pageBuilder: (context, animation, secondaryAnimation) =>
            MazeView(
              initialStep: step,
              enableBackgroundHero: false,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    );
  }

  void _showMessage(String message, {VoidCallback? onDismiss}) {
    showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        content: Text(
          message,
          style: const TextStyle(color: AppColor.darkBlue),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (onDismiss != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) onDismiss();
                });
              }
            },
            child: const Text(
              AppStrings.dialogOkayButton,
              style: TextStyle(color: AppColor.lightBlue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _enableBackgroundHero
              ? const Hero(
                  tag: CustomBackground.heroTag,
                  child: CustomBackground(),
                )
              : const CustomBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingMedium),
              child: Column(
                spacing: AppDimensions.spacingExtraLarge,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MazeWidget(currentStep: currentStep),
                  DirectionPad(onDirectionPressed: _onDirectionPressed),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
