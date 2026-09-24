import 'package:barbie_stepper/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double width;
  final double height;

  const CustomDivider({
    super.key,
    this.width = 8,
    this.height = 240,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blue,
            white,
            blue,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}