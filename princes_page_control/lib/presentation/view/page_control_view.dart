import 'package:flutter/material.dart';
import '../pages/page_one.dart';
import '../pages/page_two.dart';
import '../pages/page_three.dart';
import '../widgets/page_indicator.dart';
import 'package:princes_page_control/common/constants/colors.dart';

class PageControlView extends StatefulWidget {
  const PageControlView({super.key});

  @override
  State<PageControlView> createState() => _PageControlViewState();
}

class _PageControlViewState extends State<PageControlView> {
  final PageController pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [PageOne(), PageTwo(), PageThree()],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: PageIndicator(
                currentPage: currentPage,
                pageCount: 3,
                activeColor: currentPage == 0
                    ? black
                    : currentPage == 1
                    ? darkPurple
                    : white,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
