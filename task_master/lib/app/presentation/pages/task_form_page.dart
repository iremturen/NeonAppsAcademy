import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/common/constants/dimensions.dart';
import 'package:task_master/app/common/constants/font_size.dart';
import 'package:task_master/app/common/constants/font_weight.dart';
import 'package:task_master/app/common/widgets/custom_button.dart';
import 'package:task_master/app/common/widgets/custom_text.dart';
import 'package:task_master/app/domain/entities/task.dart';
import 'package:task_master/app/domain/enums/task_status.dart';
import 'package:task_master/app/presentation/blocs/cubits/task_cubit.dart';
import 'package:task_master/app/presentation/models/custom_button_model.dart';
import 'package:task_master/app/presentation/models/custom_text_field_model.dart';
import 'package:task_master/app/presentation/models/custom_text_model.dart';
import 'package:task_master/app/presentation/widgets/custom_deadline_form_field.dart';
import 'package:task_master/app/presentation/widgets/custom_form_field.dart';

class TaskFormPage extends StatefulWidget {
  final String pageTitle;
  final Task? task;

  const TaskFormPage({super.key, required this.pageTitle, this.task});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _deadline;

  @override
  void initState() {
    super.initState();

    final task = widget.task;

    if (task != null) {
      _titleController.text = task.title;
      _descriptionController.text = task.description;
      _deadline = task.deadline;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDeadline() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _deadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null || !mounted) return;

    setState(() {
      _deadline = selectedDate;
    });
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    final existingTask = widget.task;

    final task = Task(
      id: existingTask?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      deadline: _deadline,
      status: existingTask?.status ?? TaskStatus.pending,
    );

    final cubit = context.read<TaskCubit>();

    final success = existingTask == null
        ? await cubit.addTask(task)
        : await cubit.updateTask(task);

    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.primary,
          content: CustomText(
            model: CustomTextModel(
              text: AppStrings.taskSaveFailureMessage,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.normal,
              color: AppColors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: widget.pageTitle,
                      fontSize: AppFontSize.large,
                      fontWeight: AppFontWeight.bold,
                      color: AppColors.text,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomText(
                    model: const CustomTextModel(
                      text: AppStrings.taskFormSubtitle,
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.normal,
                      color: AppColors.secondaryText,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.spacingLarge,
                    ),
                    child: CustomFormField(
                      label: AppStrings.taskTitleLabel,
                      fieldModel: CustomTextFieldModel(
                        hintText: AppStrings.taskTitleHint,
                        controller: _titleController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.taskTitleRequiredError;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.spacingMedium,
                    ),
                    child: CustomFormField(
                      label: AppStrings.taskDescriptionLabel,
                      fieldModel: CustomTextFieldModel(
                        hintText: AppStrings.taskDescriptionHint,
                        controller: _descriptionController,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  CustomDeadlineFormField(
                    deadline: _deadline,
                    onPressed: _selectDeadline,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.spacingLarge,
                    ),
                    child: CustomButton(
                      model: CustomButtonModel(
                        text: AppStrings.saveTaskButton,
                        backgroundColor: AppColors.primary,
                        fontSize: AppFontSize.medium,
                        fontWeight: AppFontWeight.bold,
                        textColor: AppColors.white,
                        onPressed: _saveTask,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
