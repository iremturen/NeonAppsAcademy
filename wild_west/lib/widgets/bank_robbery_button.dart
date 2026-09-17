import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math' as math;
import '../constants/colors.dart';

class BankRobberyButton extends StatefulWidget {
  const BankRobberyButton({super.key});

  @override
  State<BankRobberyButton> createState() => _BankRobberyButtonState();
}

class _BankRobberyButtonState extends State<BankRobberyButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isHighlighted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRobbery() async {
    setState(() {
      isHighlighted = true;
    });
    _controller.repeat(reverse: true);
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('sounds/vault_shake.m4a'));
  }

  Future<void> stopRobbery() async {
    _controller.stop();
    _controller.reset();
    await _audioPlayer.stop();
    setState(() {
      isHighlighted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => startRobbery(),
      onTapUp: (_) => stopRobbery(),
      onTapCancel: stopRobbery,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final shakeOffset = math.sin(_controller.value * math.pi * 2) * 5;
          return Transform.translate(
            offset: Offset(shakeOffset, 0),
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 270,
          height: 60,
          decoration: BoxDecoration(
            color: isHighlighted
                ? westernGold
                : darkLeather,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: westernRust,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: shadowBlack,
                offset: Offset(0, 5),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isHighlighted
                    ? 'assets/images/vault_open.png'
                    : 'assets/images/vault_closed.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Text(
                'SHAKE THE VAULT',
                style: TextStyle(
                  color: isHighlighted
                      ? darkLeather
                      : parchment,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
