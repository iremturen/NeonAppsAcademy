import 'package:flutter/material.dart';

import 'package:harrys_challenge/common/constants/colors.dart';
import 'package:harrys_challenge/presentation/model/text_model.dart';
import 'package:harrys_challenge/presentation/widgets/custom_text.dart';
import 'package:harrys_challenge/presentation/widgets/spell_layout.dart';

class HogwartsView extends StatelessWidget {
  const HogwartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: black.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const CustomText(
                  textModel: TextModel(
                    text: 'HOGWARTS',
                    fontSize: 40,
                    color: white,
                  ),
                ),
                const CustomText(
                  textModel: TextModel(
                    text: 'Master the ancient spells',
                    fontSize: 12,
                    color: white,
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: SpellLayout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}