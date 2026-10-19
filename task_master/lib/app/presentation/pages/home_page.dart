import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/presentation/blocs/cubits/task_cubit.dart';
import 'package:task_master/app/presentation/blocs/cubits/task_state.dart';
import 'package:task_master/app/domain/enums/task_status.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';
import 'package:task_master/app/presentation/pages/task_form_page.dart';
import 'package:task_master/app/presentation/widgets/custom_search_bar.dart';
import 'package:task_master/app/presentation/widgets/custom_task_card.dart';
import 'package:task_master/app/presentation/widgets/home_page_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: CustomText(
          model: CustomTextModel(
            color: AppColors.background,
            text: AppStrings.appTitle,
            fontSize: AppFontSize.title,
            fontWeight: AppFontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          child: Column(
            spacing: AppDimensions.spacingMedium,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageHeader(
                onAddTask: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskFormPage(
                        pageTitle: AppStrings.taskFormTitle,
                      ),
                    ),
                  );
                },
              ),
              CustomSearchBar(onChanged: context.read<TaskCubit>().searchTasks),
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final selectedFilter = state is TaskLoaded
                      ? state.statusFilter
                      : null;

                  return Wrap(
                    spacing: AppDimensions.spacingSmall,
                    children: [
                      _buildFilterChip(
                        context,
                        label: AppStrings.taskFilterAll,
                        status: null,
                        selectedStatus: selectedFilter,
                      ),
                      _buildFilterChip(
                        context,
                        label: AppStrings.taskStatusPending,
                        status: TaskStatus.pending,
                        selectedStatus: selectedFilter,
                      ),
                      _buildFilterChip(
                        context,
                        label: AppStrings.taskStatusCompleted,
                        status: TaskStatus.completed,
                        selectedStatus: selectedFilter,
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoaded) {
                      if (state.tasks.isEmpty) {
                        return Center(
                          child: CustomText(
                            model: CustomTextModel(
                              text: state.hasAnyTasks
                                  ? AppStrings.homepageNoMatchingTasksMessage
                                  : AppStrings.homepageEmptyTasksMessage,
                              fontSize: AppFontSize.small,
                              fontWeight: AppFontWeight.normal,
                              color: AppColors.secondaryText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          final task = state.tasks[index];

                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppDimensions.spacingMedium,
                            ),
                            child: CustomTaskCard(
                              task: task,
                              onStatusChanged: (status) {
                                final updatedTask = task.copyWith(
                                  status: status,
                                );
                                context.read<TaskCubit>().updateTask(
                                  updatedTask,
                                );
                              },
                              onEdit: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TaskFormPage(
                                      pageTitle: AppStrings.taskFormEditTitle,
                                      task: task,
                                    ),
                                  ),
                                );
                              },
                              onDelete: () {
                                context.read<TaskCubit>().deleteTask(task.id);
                              },
                            ),
                          );
                        },
                      );
                    }

                    if (state is TaskLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is TaskError) {
                      return Center(
                        child: CustomText(
                          model: const CustomTextModel(
                            text: AppStrings.homepageLoadTasksError,
                            fontSize: AppFontSize.small,
                            fontWeight: AppFontWeight.normal,
                            color: AppColors.secondaryText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required TaskStatus? status,
    required TaskStatus? selectedStatus,
  }) {
    final isSelected = status == selectedStatus;

    return ChoiceChip(
      showCheckmark: false,
      label: CustomText(
        model: CustomTextModel(
          text: label,
          fontSize: AppFontSize.extraSmall,
          fontWeight: AppFontWeight.medium,
          color: isSelected ? AppColors.white : AppColors.text,
          textAlign: TextAlign.center,
        ),
      ),
      selected: isSelected,
      selectedColor: AppColors.primary,
      onSelected: (_) => context.read<TaskCubit>().filterByStatus(status),
    );
  }
}
