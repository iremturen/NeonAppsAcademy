import 'package:barbie_stepper/common/constants/colors.dart';
import 'package:barbie_stepper/presentation/widgets/custom_divider.dart';
import 'package:barbie_stepper/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:barbie_stepper/presentation/widgets/custom_text.dart';

class MagicalStepper extends StatefulWidget {
  const MagicalStepper({super.key});

  @override
  State<MagicalStepper> createState() => _MagicalStepperState();
}

class _MagicalStepperState extends State<MagicalStepper> {
  int value = 0;

  void decrease() {
    if (value > 0) {
      setState(() {
        value -= 5;
      });
    }
  }

  void increase() {
    if (value < 50) {
      setState(() {
        value += 5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          radius: 1.2,
          colors: [
            lightPink,
            lightPink,
            pink,
          ],
        ),
        borderRadius: BorderRadius.circular(64),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/doll1.png',
                    width: 80,
                  ),

                  CustomImageButton(
                    text: '-5',
                    imagePath: 'assets/images/heart.png',
                    onTap: decrease,
                  ),
                ],
              ),

              const CustomDivider(
                height: 140,
                width: 8,
              ),

              CustomText(
                text: '$value',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: pink,
              ),

              const CustomDivider(
                height: 140,
                width: 8,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/doll2.png',
                    width: 80,
                  ),

                  CustomImageButton(
                    text: '+5',
                    imagePath: 'assets/images/heart.png',
                    onTap: increase,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}