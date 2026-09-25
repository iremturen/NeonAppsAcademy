import 'package:flutter/material.dart';
import 'package:princes_page_control/common/constants/colors.dart';

import '../widgets/page_title.dart';
import '../widgets/page_subtitle.dart';
import '../widgets/page_image.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Column(
              children: [
                PageTitle(
                  text: 'Begin Your Journey',
                  fontSize: 40,
                  color: white,
                ),
                PageSubtitle(
                  text: 'Your magical adventure awaits',
                  fontSize: 20,
                  color: white,
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: PageImage(
              imagePath: 'assets/images/prince_working.png',
              width: 360,
            ),
          ),
        ],
      ),
    );
  }
}