import 'package:flutter/material.dart';
import '../constants/colors.dart';

class VigilanteButton extends StatefulWidget {
  const VigilanteButton({super.key});

  @override
  State<VigilanteButton> createState() => _VigilanteButtonState();
}

class _VigilanteButtonState extends State<VigilanteButton> {
  bool isPressed = false;

  void setPressed(bool value) {
    setState(() {
      isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTapCancel: () => setPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 270,
        height: 60,
        decoration: BoxDecoration(
          color: isPressed
              ? westernGold
              : darkLeather,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: vigilanteBrown,
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
              'assets/images/badge.png',
              width: 28,
              height: 28,
              color: isPressed
                ? deepVigilanteBrown
                : lightSaddle,
            ),
            const SizedBox(width: 10),
            Text(
              'VIGILANTE ALERT',
              style: TextStyle(
                color: isPressed ? darkLeather : parchment,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
