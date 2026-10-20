import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/common/constants/app_string.dart';
import 'package:coral_memory_archive/common/constants/dimensions.dart';
import 'package:coral_memory_archive/common/constants/font_size.dart';
import 'package:coral_memory_archive/common/constants/font_weight.dart';
import 'package:coral_memory_archive/common/widgets/custom_text.dart';
import 'package:coral_memory_archive/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/presentation/cubit/coral_memory_state.dart';
import 'package:coral_memory_archive/presentation/cubit/enum/coral_memory_status.dart';
import 'package:coral_memory_archive/presentation/models/custom_text_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_icon_model.dart';
import 'package:coral_memory_archive/presentation/pages/memory_detail_page.dart';
import 'package:coral_memory_archive/presentation/pages/memory_form_page.dart';
import 'package:coral_memory_archive/presentation/widgets/custom_search_bar.dart';
import 'package:coral_memory_archive/presentation/widgets/memory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          final cubit = context.read<CoralMemoryCubit>();

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
          model: CustomIconModel(icon: Icons.add, semanticLabel: 'Add memory'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMedium),
        child: Column(
          spacing: AppDimensions.spacingMedium,
          children: [
            CustomSearchBar(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim().toLowerCase();
                });
              },
            ),

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
                          text: state.errorMessage ?? 'Something went wrong.',
                          fontSize: AppFontSize.medium,
                          fontWeight: AppFontWeight.normal,
                          color: AppColors.secondaryText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  final memories = state.memories.where((memory) {
                    return memory.title.toLowerCase().contains(_searchQuery) ||
                        memory.species.toLowerCase().contains(_searchQuery) ||
                        memory.category.toLowerCase().contains(_searchQuery) ||
                        memory.location.toLowerCase().contains(_searchQuery);
                  }).toList();

                  if (memories.isEmpty) {
                    return Center(
                      child: CustomText(
                        model: CustomTextModel(
                          text: _searchQuery.isEmpty
                              ? 'No memories yet. Add your first coral memory!'
                              : 'No memories match your search.',
                          fontSize: AppFontSize.medium,
                          fontWeight: AppFontWeight.normal,
                          color: AppColors.secondaryText,
                          textAlign: TextAlign.center,
                        ),
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
                              builder: (_) => MemoryDetailsPage(memory: memory),
                            ),
                          );
                        },
                        onEdit: () {
                          // Edit form will be connected here.
                        },
                        onDelete: () {
                          context.read<CoralMemoryCubit>().deleteMemory(
                            memory.id,
                          );
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
    );
  }
}
