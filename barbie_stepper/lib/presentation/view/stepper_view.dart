import 'package:barbie_stepper/common/constants/colors.dart';
import 'package:barbie_stepper/presentation/widgets/custom_title_text.dart';
import 'package:barbie_stepper/presentation/widgets/magical_stepper.dart';
import 'package:flutter/material.dart';

class StepperView extends StatelessWidget {
  const StepperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 160,
              left: 0,
              right: 0,
              child: CustomTitleText(
                text: 'My Outfits',
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: pink,
                borderColor: white,
                borderWidth: 7.0,
              ),
            ),

            Positioned(
              top: 460,
              left: 0,
              right: 0,
              child: MagicalStepper(),
            ),
          ],
        ),
      ),
    );
  }
}