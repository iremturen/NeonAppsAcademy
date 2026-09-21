import 'package:dragon_slayer/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'presentation/widgets/custom_title_text.dart';
import 'presentation/widgets/dragon_slider.dart';
import 'presentation/widgets/slider_value_card.dart';

void main() {
  runApp(const DragonSlayerApp());
}

class DragonSlayerApp extends StatefulWidget {
  const DragonSlayerApp({super.key});

  @override
  State<DragonSlayerApp> createState() => _DragonSlayerAppState();
}

class _DragonSlayerAppState extends State<DragonSlayerApp> {
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),

              CustomTitleText(
                text: 'DRAGON SLAYER',
                fontSize: 40,
                color: purple,
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DragonSlider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 16),

              SliderValueCard(value: sliderValue),
            ],
          ),
        ),
      ),
    );
  }
}
