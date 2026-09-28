import 'package:flutter/material.dart';
import 'package:tony_scroll_view/common/constants/colors.dart';
import 'package:tony_scroll_view/common/constants/dimensions.dart';
import 'package:tony_scroll_view/presentation/model/text_model.dart';

import 'custom_text.dart';

class EndScrollAlert {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          content: CustomText(
            model: TextModel(
              text: 'You have reached the end of the scroll view.',
              fontSize: alertMsgFontSize,
              color: white,
            ),
          ),
        );
      },
    );
  }
}