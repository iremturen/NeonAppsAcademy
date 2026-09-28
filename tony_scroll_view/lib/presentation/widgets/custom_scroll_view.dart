import 'package:flutter/material.dart';
import 'package:tony_scroll_view/common/constants/colors.dart';
import 'package:tony_scroll_view/data/text_data.dart';
import 'package:tony_scroll_view/presentation/model/custom_container_model.dart';
import 'package:tony_scroll_view/presentation/model/text_model.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_container.dart';
import '../widgets/end_scroll_alert.dart';

class CustomScrollViewWidget extends StatefulWidget {
  const CustomScrollViewWidget({super.key});

  @override
  State<CustomScrollViewWidget> createState() => _CustomScrollViewWidgetState();
}

class _CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {
  final ScrollController _scrollController = ScrollController();

  bool _isAlertShown = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final position = _scrollController.position;

    if (position.pixels >= position.maxScrollExtent - 10 && !_isAlertShown) {
      _isAlertShown = true;

      EndScrollAlert.show(context).then((_) {
        _isAlertShown = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const itemVerticalMargin = 20.0;
        final itemHeight = constraints.maxHeight / 4 - itemVerticalMargin;

        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: textModels.map((model) {
              return CustomContainer(
                model: CustomContainerModel(
                  width: double.infinity,
                  height: itemHeight,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: red, width: 2),
                  color: darkBlue.withValues(alpha: 0.75),
                  imagePath: 'assets/images/circular_icon.png',
                ),
                child: CustomText(
                  model: TextModel(
                    text: model.text,
                    fontSize: model.fontSize,
                    fontWeight: model.fontWeight,
                    color: gold,
                    textAlign: model.textAlign,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
