import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinocchio_alerts/common/constants/colors.dart';
import 'package:pinocchio_alerts/common/constants/dimensions.dart';
import 'package:pinocchio_alerts/presentation/data/action_sheet_options.dart';
import 'package:pinocchio_alerts/presentation/model/alert_model.dart';
import 'package:pinocchio_alerts/presentation/model/button_model.dart';
import 'package:pinocchio_alerts/presentation/model/snack_bar_model.dart';
import 'package:pinocchio_alerts/presentation/model/text_model.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_alert.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_button.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_snack_bar.dart';
import 'package:pinocchio_alerts/presentation/widgets/custom_text.dart';
import 'package:share_plus/share_plus.dart';

class AlertActions {
  static void showNoButtons(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomAlert(
          model: AlertModel(
            title: 'No Buttons',
            child: CustomText(
              model: TextModel(
                text: 'This alert has no buttons.',
                fontSize: subtitleFontSize,
                color: darkBrown,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  static void showOneButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomAlert(
          model: AlertModel(
            title: 'One Button',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: TextModel(
                    text: 'This alert has one button.',
                    fontSize: subtitleFontSize,
                    color: darkBrown,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  model: ButtonModel(
                    title: 'OK',
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      CustomSnackBar.show(
                        context,
                        const SnackBarModel(message: 'OK'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showTwoButtons(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomAlert(
          model: AlertModel(
            title: 'Two Buttons',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: TextModel(
                    text: 'This alert has two buttons.',
                    fontSize: subtitleFontSize,
                    color: darkBrown,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      model: ButtonModel(
                        title: 'YES',
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          CustomSnackBar.show(
                            context,
                            const SnackBarModel(message: 'YES'),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    CustomButton(
                      model: ButtonModel(
                        title: 'NO',
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          CustomSnackBar.show(
                            context,
                            const SnackBarModel(message: 'NO'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showTextField(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomAlert(
          model: AlertModel(
            title: 'Text Field',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: TextModel(
                    text: 'Enter something below.',
                    fontSize: subtitleFontSize,
                    color: darkBrown,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  style: GoogleFonts.margarine(fontSize: 16, color: darkBrown),
                  decoration: InputDecoration(
                    hintText: 'Type something...',
                    hintStyle: GoogleFonts.margarine(
                      fontSize: 14,
                      color: darkBrown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  model: ButtonModel(
                    title: 'SUBMIT',
                    onPressed: () {
                      final enteredText = controller.text;
                      Navigator.pop(dialogContext);
                      CustomSnackBar.show(
                        context,
                        SnackBarModel(message: enteredText),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showActionSheet(BuildContext context) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: const Text('Choose an Option'),
        message: const Text('Choose what Pinocchio should do next.'),
        actions: actionSheetOptions
            .map(
              (option) => CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(sheetContext, option),
                child: Text(option),
              ),
            )
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: const Text('Cancel'),
        ),
      ),
    ).then((selectedOption) {
      if (selectedOption != null && context.mounted) {
        CustomSnackBar.show(
          context,
          SnackBarModel(message: selectedOption),
        );
      }
    });
  }

  static void showActivityController(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlert(
          model: AlertModel(
            title: 'Share Pinocchio',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  model: TextModel(
                    text: 'Choose something to share.',
                    fontSize: subtitleFontSize,
                    color: darkBrown,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  model: ButtonModel(
                    title: 'Share Image',
                    onPressed: () async {
                      final bytes = await rootBundle.load(
                        'assets/images/story_image.jpg',
                      );

                      await SharePlus.instance.share(
                        ShareParams(
                          files: [
                            XFile.fromData(
                              bytes.buffer.asUint8List(),
                              name: 'story_image.jpg',
                              mimeType: 'image/jpg',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  model: ButtonModel(
                    title: 'Share File',
                    onPressed: () async {
                      final bytes = await rootBundle.load(
                        'assets/files/pinocchio_story.txt',
                      );

                      await SharePlus.instance.share(
                        ShareParams(
                          files: [
                            XFile.fromData(
                              bytes.buffer.asUint8List(),
                              name: 'pinocchio_story.txt',
                              mimeType: 'text/plain',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
