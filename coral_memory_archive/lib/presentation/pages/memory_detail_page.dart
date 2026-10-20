import 'package:flutter/material.dart';
import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/common/widgets/custom_image.dart';
import 'package:coral_memory_archive/presentation/models/custom_image_model.dart';

class MemoryDetailsPage extends StatelessWidget {
  final CoralMemoryFragment memory;

  const MemoryDetailsPage({super.key, required this.memory});

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memory Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (memory.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomImage(
                model: CustomImageModel(
                  imageUrl: memory.imageUrl,
                  height: 240,
                  width: double.infinity,
                ),
              ),
            )
          else
            _imagePlaceholder(),

          const SizedBox(height: 20),

          Text(
            memory.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 20),

          _buildInfoRow('Species', memory.species),
          _buildInfoRow('Category', memory.category),
          _buildInfoRow('Location', memory.location),
          _buildInfoRow('Discovery Date', _formatDate(memory.discoveredAt)),

          const SizedBox(height: 20),

          Text(
            'Description',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            memory.description.isEmpty
                ? 'No description available.'
                : memory.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value.isEmpty ? 'Not specified' : value)),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.water, size: 48),
    );
  }
}
