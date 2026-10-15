import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reviva/app/common/constants/app_strings.dart';
import 'package:reviva/app/common/constants/colors.dart';
import 'package:reviva/app/common/constants/dimensions.dart';
import 'package:reviva/app/common/constants/font_size.dart';
import 'package:reviva/app/common/constants/font_weight.dart';
import 'package:reviva/app/common/widgets/custom_container.dart';
import 'package:reviva/app/common/widgets/custom_icon.dart';
import 'package:reviva/app/presentation/controller/photo_picker_controller.dart';
import 'package:reviva/app/presentation/models/custom_container_model.dart';
import 'package:reviva/app/presentation/models/custom_icon_model.dart';
import 'package:reviva/app/presentation/models/custom_text_model.dart';
import 'package:reviva/app/common/widgets/custom_text.dart';
import 'package:reviva/app/presentation/pages/photo_enhancement_page.dart';
import 'package:reviva/app/presentation/widgets/photo_picker_actions.dart';

class PhotoPickerView extends StatefulWidget {
  final ValueChanged<File?> onImageSelected;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const PhotoPickerView({
    super.key,
    required this.onImageSelected,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<PhotoPickerView> createState() => _PhotoPickerViewState();
}

class _PhotoPickerViewState extends State<PhotoPickerView> {
  late final PhotoPickerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PhotoPickerController();
    _controller.addListener(_onPhotoChanged);
  }

  void _onPhotoChanged() {
    if (!mounted) return;

    setState(() {});
    widget.onImageSelected(_controller.selectedImage);
  }

  Future<void> _pickPhotoFromCamera() async {
    await _controller.pickImage(ImageSource.camera);

    if (!mounted) return;

    final imageFile = _controller.selectedImage;

    if (imageFile == null) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoEnhancementPage(
          imageFile: imageFile,
          isDarkMode: widget.isDarkMode,
          onThemeChanged: widget.onThemeChanged,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onPhotoChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final File? selectedImage = _controller.selectedImage;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacingMedium),
      child: Column(
        spacing: AppDimensions.spacingLarge,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _controller.pickImage(ImageSource.gallery),
              child: CustomContainer(
                model: CustomContainerModel(
                  width: double.infinity,
                  color: AppColors.transparent,
                  borderRadius: AppDimensions.borderRadius,
                  border: Border.all(
                    color: colorScheme.primary,
                    width: AppDimensions.photoPickContainerBorder,
                  ),
                  padding: const EdgeInsets.all(AppDimensions.spacingMedium),
                ),
                child: selectedImage == null
                    ? Column(
                        spacing: AppDimensions.spacingSmall,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(
                            model: CustomIconModel(
                              icon: Icons.add_photo_alternate_outlined,
                              size: AppDimensions.photoPickIconSize,
                              color: colorScheme.primary,
                            ),
                          ),
                          CustomText(
                            model: CustomTextModel(
                              text: AppStrings.pickPhotoTitle,
                              fontSize: AppFontSize.medium.value,
                              fontWeight: AppFontWeight.bold.value,
                              color: colorScheme.onSurface,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CustomText(
                            model: CustomTextModel(
                              text: AppStrings.pickPhotoSubtitle,
                              fontSize: AppFontSize.small.value,
                              fontWeight: AppFontWeight.normal.value,
                              color: colorScheme.onSurface,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.borderRadius,
                        ),
                        child: Image.file(
                          selectedImage,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
              ),
            ),
          ),
          PhotoPickerActions(
            onChoosePhoto: () => _controller.pickImage(ImageSource.gallery),
            onTakePhoto: _pickPhotoFromCamera,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
