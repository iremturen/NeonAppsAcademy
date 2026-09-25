import 'package:flutter/material.dart';
import 'package:princes_page_control/common/constants/colors.dart';

import '../widgets/page_image.dart';
import '../widgets/page_title.dart';
import '../widgets/page_subtitle.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      body: Stack(
        children: [
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Column(
              children: [
                PageTitle(
                  text: 'Explore the Kingdom',
                  fontSize: 40,
                  color: black,
                ),
                PageSubtitle(
                  text: 'Discover magical places and hidden treasures',
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
                imagePath: 'assets/images/castle.png',
                width: 440,
              ),
            ),
          ),
        ],
      ),
    );
  }
}