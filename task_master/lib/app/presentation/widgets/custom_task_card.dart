import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/domain/entities/task.dart';
import 'package:task_master/app/domain/enums/task_status.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';

class CustomTaskCard extends StatelessWidget {
  final Task task;
  final ValueChanged<TaskStatus> onStatusChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomTaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        border: Border.all(
          color: AppColors.secondaryText.withValues(
            alpha: AppDimensions.taskCardBorderAlpha,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomText(
                  model: CustomTextModel(
                    text: task.title,
                    fontSize: AppFontSize.large,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.text,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined),
                color: AppColors.primary,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline),
                color: AppColors.deleteIcon,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          if (task.description.isNotEmpty) ...[
            CustomText(
              model: CustomTextModel(
                text: task.description,
                fontSize: AppFontSize.small,
                fontWeight: AppFontWeight.normal,
                color: AppColors.secondaryText,
                textAlign: TextAlign.left,
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.spacingLarge),
            child: Row(
              spacing: AppDimensions.spacingSmall,
              children: [
                _buildStatusButton(
                  label: AppStrings.taskStatusPending,
                  status: TaskStatus.pending,
                  color: AppColors.pending,
                ),
                _buildStatusButton(
                  label: AppStrings.taskStatusCompleted,
                  status: TaskStatus.completed,
                  color: AppColors.completed,
                ),
                const Spacer(),
                if (task.deadline != null) ...[
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: AppDimensions.calenderIconSize,
                    color: AppColors.secondaryText,
                  ),
                  CustomText(
                    model: CustomTextModel(
                      text: DateFormat('MMM d').format(task.deadline!),
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.normal,
                      color: AppColors.secondaryText,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton({
    required String label,
    required TaskStatus status,
    required Color color,
  }) {
    final isSelected = task.status == status;

    return OutlinedButton(
      onPressed: () => onStatusChanged(status),
      style: OutlinedButton.styleFrom(
        foregroundColor: isSelected ? AppColors.white : color,
        backgroundColor: isSelected ? color : AppColors.white,
        side: BorderSide(color: color),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMedium, vertical: AppDimensions.spacingSmall),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: CustomText(
        model: CustomTextModel(
          text: label,
          fontSize: AppFontSize.extraSmall,
          fontWeight: AppFontWeight.bold,
          color: isSelected ? AppColors.white : color,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
