import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picker_challenge/constants/colors.dart';
import 'package:picker_challenge/constants/dimensions.dart';
import 'package:picker_challenge/presentation/models/custom_container_model.dart';
import 'package:picker_challenge/presentation/models/custom_text_model.dart';
import 'package:picker_challenge/presentation/models/user_model.dart';
import 'package:picker_challenge/presentation/widgets/custom_container.dart';
import 'package:picker_challenge/presentation/widgets/custom_text.dart';

class PhotoPickerView extends StatefulWidget {
  final UserModel model;
  final ValueChanged<ImageProvider> onImageChanged;

  const PhotoPickerView({
    super.key,
    required this.model,
    required this.onImageChanged,
  });

  @override
  State<PhotoPickerView> createState() => _PhotoPickerViewState();
}

class _PhotoPickerViewState extends State<PhotoPickerView> {
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    widget.onImageChanged(FileImage(File(image.path)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            model: CustomTextModel(
              text: 'Choose a Profile Photo',
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: widget.model.fontFamily,
            ),
          ),

          const SizedBox(height: 8),

          CustomText(
            model: CustomTextModel(
              text: 'Select a photo from your gallery',
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: grey,
              fontFamily: widget.model.fontFamily,
            ),
          ),

          const SizedBox(height: 36),

          GestureDetector(
            onTap: pickImage,
            child: CustomContainer(
              model: CustomContainerModel(
                width: pickImageContainer,
                height: pickImageContainer,
                color: grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(borderRadius)
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: pickImageIconSize,
                color: grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
