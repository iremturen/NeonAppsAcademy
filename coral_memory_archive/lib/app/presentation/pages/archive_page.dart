import 'package:coral_memory_archive/app/common/constants/app_colors.dart';
import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/common/constants/dimensions.dart';
import 'package:coral_memory_archive/app/common/constants/font_size.dart';
import 'package:coral_memory_archive/app/common/constants/font_weight.dart';
import 'package:coral_memory_archive/app/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/app/common/widgets/custom_text.dart';
import 'package:coral_memory_archive/app/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_state.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_status.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_icon_model.dart';
import 'package:coral_memory_archive/app/presentation/models/custom_text_model.dart';
import 'package:coral_memory_archive/app/presentation/pages/memory_detail_page.dart';
import 'package:coral_memory_archive/app/presentation/pages/memory_form_page.dart';
import 'package:coral_memory_archive/app/presentation/widgets/custom_search_bar.dart';
import 'package:coral_memory_archive/app/presentation/widgets/memory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _confirmDelete(BuildContext context, CoralMemoryFragment memory) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          AppStrings.confirmDeleteTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          AppStrings.deleteItemConfirmation(memory.title),
          style: const TextStyle(color: AppColors.secondaryText),
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CoralMemoryCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.ocean,
        title: CustomText(
          model: CustomTextModel(
            color: AppColors.white,
            text: AppStrings.appTitle,
            fontSize: AppFontSize.large,
            fontWeight: AppFontWeight.bold,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.teal,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: cubit,
                child: const MemoryFormPage(),
              ),
            ),
          );
        },
        child: const CustomIcon(
          model: CustomIconModel(
            icon: Icons.add,
            semanticLabel: AppStrings.addMemorySemanticLabel,
          ),
        ),
      ),
      body: BlocListener<CoralMemoryCubit, CoralMemoryState>(
        listenWhen: (previous, current) =>
            previous.benchmarkInfo != current.benchmarkInfo &&
            current.benchmarkInfo != null,
        listener: (context, state) {
          if (state.benchmarkInfo != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.surface,
                content: Text(
                  state.benchmarkInfo!,
                  style: const TextStyle(color: AppColors.aqua),
                ),
                duration: const Duration(
                  seconds: AppDimensions.snackBarDurationSeconds,
                ),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          child: Column(
            spacing: AppDimensions.spacingSmall,
            children: [
              // Fast Search Bar
              CustomSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  cubit.searchMemories(query: value);
                },
              ),

              // Category Filter Chips
              BlocBuilder<CoralMemoryCubit, CoralMemoryState>(
                buildWhen: (prev, curr) =>
                    prev.selectedCategory != curr.selectedCategory,
                builder: (context, state) {
                  final categories = [
                    AppStrings.allCategory,
                    ...AppStrings.memoryCategories,
                  ];

                  return SizedBox(
                    height: AppDimensions.categoryChipListHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppDimensions.spacingSmall),
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isSelected =
                            (cat == AppStrings.allCategory &&
                                    (state.selectedCategory == null ||
                                        state.selectedCategory ==
                                            AppStrings.allCategory)) ||
                                state.selectedCategory == cat;

                        return ChoiceChip(
                          label: Text(
                            cat.replaceAll('_', ' '),
                            style: TextStyle(
                              fontSize: AppDimensions.categoryChipFontSize,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? AppColors.black
                                  : AppColors.textPrimary,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.aqua,
                          backgroundColor: AppColors.surface,
                          onSelected: (_) {
                            cubit.setCategoryFilter(
                              cat == AppStrings.allCategory ? null : cat,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),

              // Active filter indicator & count
              BlocBuilder<CoralMemoryCubit, CoralMemoryState>(
                builder: (context, state) {
                  final activeFilters = <String>[];
                  if (state.searchQuery.isNotEmpty) {
                    activeFilters.add('"${state.searchQuery}"');
                  }
                  if (state.selectedCategory != null &&
                      state.selectedCategory != AppStrings.allCategory) {
                    activeFilters.add(state.selectedCategory!);
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spacingSmall,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.fragmentsCount(state.memories.length),
                          style: const TextStyle(
                            fontSize: AppDimensions.filterStatusFontSize,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (activeFilters.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              cubit.clearFilters();
                            },
                            child: const Text(
                              AppStrings.clearFilters,
                              style: TextStyle(
                                fontSize: AppDimensions.filterStatusFontSize,
                                color: AppColors.aqua,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),

              // Memories List
              Expanded(
                child: BlocBuilder<CoralMemoryCubit, CoralMemoryState>(
                  builder: (context, state) {
                    if (state.status == CoralMemoryStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.status == CoralMemoryStatus.error) {
                      return Center(
                        child: CustomText(
                          model: CustomTextModel(
                            text:
                                state.errorMessage ??
                                AppStrings.defaultErrorMessage,
                            fontSize: AppFontSize.medium,
                            fontWeight: AppFontWeight.normal,
                            color: AppColors.secondaryText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    final memories = state.memories;

                    if (memories.isEmpty) {
                      final hasFilter =
                          state.searchQuery.isNotEmpty ||
                          (state.selectedCategory != null &&
                              state.selectedCategory != AppStrings.allCategory);

                      return Center(
                        child: Column(
                          spacing: AppDimensions.spacingMedium,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bubble_chart_outlined,
                              size: AppDimensions.emptyStateIconSize,
                              color: AppColors.outline,
                            ),
                            CustomText(
                              model: CustomTextModel(
                                text: hasFilter
                                    ? AppStrings.emptyFilterMessage
                                    : AppStrings.emptyArchiveMessage,
                                fontSize: AppFontSize.medium,
                                fontWeight: AppFontWeight.normal,
                                color: AppColors.secondaryText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: memories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppDimensions.spacingMedium),
                      itemBuilder: (context, index) {
                        final memory = memories[index];

                        return MemoryCard(
                          memory: memory,
                          onDetails: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    MemoryDetailsPage(memory: memory),
                              ),
                            );
                          },
                          onEdit: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: cubit,
                                  child: MemoryFormPage(memory: memory),
                                ),
                              ),
                            );
                          },
                          onDelete: () {
                            _confirmDelete(context, memory);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
