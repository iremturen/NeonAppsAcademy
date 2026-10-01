import 'package:bee_counter/common/constants/colors.dart';
import 'package:bee_counter/common/constants/dimensions.dart';
import 'package:bee_counter/common/helpers/counter_helper.dart';
import 'package:bee_counter/presentation/model/custom_container_model.dart';
import 'package:bee_counter/presentation/model/custom_button_model.dart';
import 'package:bee_counter/presentation/model/custom_image_model.dart';
import 'package:bee_counter/presentation/model/custom_text_model.dart';
import 'package:bee_counter/presentation/widgets/custom_circular_indicator.dart';
import 'package:bee_counter/presentation/widgets/custom_container.dart';
import 'package:bee_counter/presentation/widgets/custom_button.dart';
import 'package:bee_counter/presentation/widgets/custom_image.dart';
import 'package:bee_counter/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BeeCounterView extends StatefulWidget {
  const BeeCounterView({super.key});

  @override
  State<BeeCounterView> createState() => _BeeCounterViewState();
}

class _BeeCounterViewState extends State<BeeCounterView> {
  int counter = 0;
  bool isCounting = false;

  Future<void> startCounter() async {
    setState(() {
      counter = 0;
      isCounting = true;
    });

    await CounterHelper.startCounter(
      onCount: (value) {
        if (!mounted) return;

        setState(() {
          counter = value;
        });
      },
      onComplete: () {
        if (!mounted) return;

        setState(() {
          isCounting = false;
        });
      },
    );
  }

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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
              const SizedBox(height: 20),

              CustomText(
                model: CustomTextModel(
                  text: 'NEON ACADEMY',
                  fontSize: subtitleFontSize,
                  color: black,
                ),
              ),

              const SizedBox(height: 56),

              CustomImage(
                model: CustomImageModel(
                  imagePath: 'assets/images/bee.png',
                  width: iconWidth,
                  height: iconHeight,
                ),
              ),

              const SizedBox(height: 4),

              CustomText(
                model: CustomTextModel(
                  text: 'BEE COUNTER',
                  fontSize: titleFontSize,
                  color: black,
                ),
              ),

              CustomText(
                model: CustomTextModel(
                  text: 'Small steps, big progress!',
                  fontSize: subtitleFontSize,
                  color: black,
                ),
              ),

              const SizedBox(height: 32),

              if (isCounting)
                CustomContainer(
                  model: CustomContainerModel(
                    width: counterCardWidth,
                    height: counterCardHeight,
                    color: cream,
                    borderRadius: BorderRadius.circular(24),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomCircularProgressIndicator(counter: counter),
                          CustomText(
                            model: CustomTextModel(
                              text: '$counter',
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          CustomText(
                            model: CustomTextModel(
                              text: 'Amazing work!',
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              CustomButton(
                model: CustomButtonModel(
                  text: 'Start Counting',
                  onPressed: isCounting ? null : startCounter,
                  backgroundColor: yellow,
                  width: buttonWidth,
                  height: buttonHeight,
                  elevation: buttonWidth,
                  shadowColor: black.withValues(alpha: disabledOpacity),
                  borderRadius: borderRadius,
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
