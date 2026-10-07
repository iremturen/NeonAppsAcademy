import 'package:flutter/material.dart';

import 'package:secret_decryption/constants/colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            bg1,
            bg2,
            bg3,
          ],
        ),
      ),
      child: child,
    );
  }
}