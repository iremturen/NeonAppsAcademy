import 'package:coral_memory_archive/app/common/constants/app_colors.dart';
import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/common/constants/dimensions.dart';
import 'package:coral_memory_archive/app/common/widgets/custom_image.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_image_model.dart';
import 'package:coral_memory_archive/app/presentation/pages/memory_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemoryDetailsPage extends StatelessWidget {
  final CoralMemoryFragment memory;

  const MemoryDetailsPage({super.key, required this.memory});

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day/$month/$year';
  }

  void _confirmDelete(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          AppStrings.confirmDeleteTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          AppStrings.confirmDeleteMessage,
          style: TextStyle(color: AppColors.secondaryText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.secondaryText),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text(AppStrings.confirm),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true && context.mounted) {
        context.read<CoralMemoryCubit>().deleteMemory(memory.id);
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.memoryDetailsTitle),
        actions: [
          IconButton(
            tooltip: AppStrings.popupEdit,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              final cubit = context.read<CoralMemoryCubit>();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: cubit,
                    child: MemoryFormPage(memory: memory),
                  ),
                ),
              );
            },
          ),
          IconButton(
            tooltip: AppStrings.popupDelete,
            icon: const Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () => _confirmDelete(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.spacingMedium),
        children: [
          if (memory.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDimensions.detailImageBorderRadius,
              ),
              child: CustomImage(
                model: CustomImageModel(
                  imageUrl: memory.imageUrl,
                  height: AppDimensions.detailImageHeight,
                  width: double.infinity,
                ),
              ),
            )
          else
            _imagePlaceholder(),

          const SizedBox(height: AppDimensions.spacingMedium),

          Text(
            memory.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: AppDimensions.spacingMedium),

          _buildInfoRow(AppStrings.speciesLabel, memory.species),
          _buildInfoRow(AppStrings.categoryLabel, memory.category),
          _buildInfoRow(AppStrings.locationLabel, memory.location),
          _buildInfoRow(
            AppStrings.discoveryDateLabel,
            _formatDate(memory.discoveredAt),
          ),

          const SizedBox(height: AppDimensions.spacingMedium),

          Text(
            AppStrings.descriptionLabel,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: AppDimensions.spacingSmall),

          Text(
            memory.description.isEmpty
                ? AppStrings.noDescriptionAvailable
                : memory.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              height: AppDimensions.detailDescriptionLineHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimensions.detailInfoRowSpacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppDimensions.detailInfoLabelWidth,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value.isEmpty ? AppStrings.notSpecified : value),
          ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: AppDimensions.detailPlaceholderHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(
          AppDimensions.detailImageBorderRadius,
        ),
      ),
      child: const Icon(
        Icons.water,
        size: AppDimensions.detailPlaceholderIconSize,
        color: AppColors.teal,
      ),
    );
  }
}
