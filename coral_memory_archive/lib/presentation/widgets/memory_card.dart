import 'package:flutter/material.dart';
import 'package:coral_memory_archive/common/constants/app_string.dart';
import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/common/constants/dimensions.dart';
import 'package:coral_memory_archive/common/constants/font_size.dart';
import 'package:coral_memory_archive/common/constants/font_weight.dart';
import 'package:coral_memory_archive/common/widgets/custom_text.dart';
import 'package:coral_memory_archive/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/common/widgets/custom_image.dart';
import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/presentation/models/custom_text_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_icon_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_image_model.dart';

class MemoryCard extends StatelessWidget {
  final CoralMemoryFragment memory;
  final VoidCallback onDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MemoryCard({
    super.key,
    required this.memory,
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      AppDimensions.textFieldBorderRadius,
    );

    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMedium),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: const BorderSide(
          color: AppColors.outline,
          width: AppDimensions.cardBorderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingSmall),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: SizedBox(
                width: AppDimensions.memoryCardImageWidth,
                height: AppDimensions.memoryCardImageHeight,
                child: CustomImage(
                  model: CustomImageModel(
                    imageUrl: memory.imageUrl,
                    width: AppDimensions.memoryCardImageWidth,
                    height: AppDimensions.memoryCardImageHeight,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                spacing: AppDimensions.spacingSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: memory.title,
                      fontSize: AppFontSize.medium,
                      fontWeight: AppFontWeight.bold,
                      color: AppColors.textPrimary,
                      textAlign: TextAlign.left,
                    ),
                  ),

                  CustomText(
                    model: CustomTextModel(
                      text: memory.species,
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.normal,
                      color: AppColors.textPrimary,
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Row(
                    spacing: AppDimensions.spacingSmall,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomIcon(
                        model: CustomIconModel(
                          icon: Icons.location_on_outlined,
                          size: AppDimensions.locationIconSize,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          model: CustomTextModel(
                            text: memory.location,
                            fontSize: AppFontSize.small,
                            fontWeight: AppFontWeight.normal,
                            color: AppColors.secondaryText,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              tooltip: AppStrings.cardDetails,
              icon: const CustomIcon(
                model: CustomIconModel(
                  icon: Icons.more_vert,
                  color: AppColors.textPrimary,
                ),
              ),
              color: AppColors.surface,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: const BorderSide(
                  color: AppColors.outline,
                  width: AppDimensions.cardBorderWidth,
                ),
              ),
              onSelected: (value) {
                switch (value) {
                  case 'details':
                    onDetails();
                  case 'edit':
                    onEdit();
                  case 'delete':
                    onDelete();
                }
              },
              itemBuilder: (context) => [
                _buildMenuItem(
                  value: 'details',
                  icon: Icons.visibility_outlined,
                  label: AppStrings.cardDetails,
                ),
                _buildMenuItem(
                  value: 'edit',
                  icon: Icons.edit_outlined,
                  label: AppStrings.popupEdit,
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    spacing: AppDimensions.spacingSmall,
                    children: [
                      const CustomIcon(
                        model: CustomIconModel(
                          icon: Icons.delete_outline,
                          size: AppDimensions.memoryCardMenuIconSize,
                          color: Colors.redAccent,
                        ),
                      ),
                      CustomText(
                        model: CustomTextModel(
                          text: AppStrings.popupDelete,
                          fontSize: AppFontSize.small,
                          fontWeight: AppFontWeight.normal,
                          color: Colors.redAccent,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    required String value,
    required IconData icon,
    required String label,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        spacing: AppDimensions.spacingSmall,
        children: [
          CustomIcon(
            model: CustomIconModel(
              icon: icon,
              size: AppDimensions.memoryCardMenuIconSize,
              color: AppColors.textPrimary,
            ),
          ),
          CustomText(
            model: CustomTextModel(
              text: label,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.normal,
              color: AppColors.textPrimary,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
