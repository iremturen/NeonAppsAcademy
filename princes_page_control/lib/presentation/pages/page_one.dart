import 'package:flutter/material.dart';
import 'package:princes_page_control/common/constants/colors.dart';

import '../widgets/page_image.dart';
import '../widgets/page_title.dart';
import '../widgets/page_subtitle.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Column(
              children: [
                PageTitle(
                  text: 'Welcome to the Kingdom',
                  fontSize: 40,
                  color: black,
                ),
                PageSubtitle(
                  text: 'Discover a world of magic & wonder',
                  fontSize: 20,
                  color: black,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: PageImage(
                imagePath: 'assets/images/prince.png',
                width: 340,
              ),
            ),
          ),
        ],
      ),
    );
  }
}