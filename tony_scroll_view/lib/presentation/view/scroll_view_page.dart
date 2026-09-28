import 'package:flutter/material.dart';
import 'package:tony_scroll_view/common/constants/colors.dart';
import 'package:tony_scroll_view/presentation/widgets/custom_scroll_view.dart';

import '../widgets/custom_text.dart';
import '../model/text_model.dart';

class ScrollViewPage extends StatelessWidget {
  const ScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 80),
              CustomText(
                model: TextModel(
                  text: "STARK'S INVENTIONS",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gold,
                ),
              ),
              const SizedBox(height: 28),
              const Expanded(child: CustomScrollViewWidget()),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
