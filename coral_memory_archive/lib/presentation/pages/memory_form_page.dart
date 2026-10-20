import 'package:coral_memory_archive/data/models/coral_memory_fragment.dart';
import 'package:coral_memory_archive/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/presentation/cubit/coral_memory_state.dart';
import 'package:coral_memory_archive/presentation/cubit/enum/coral_memory_status.dart';
import 'package:coral_memory_archive/common/widgets/custom_icon.dart';
import 'package:coral_memory_archive/common/widgets/custom_button.dart';
import 'package:coral_memory_archive/common/widgets/custom_text.dart';
import 'package:coral_memory_archive/common/widgets/custom_text_field.dart';
import 'package:coral_memory_archive/presentation/models/custom_icon_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_button_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_text_model.dart';
import 'package:coral_memory_archive/presentation/models/custom_text_field_model.dart';
import 'package:coral_memory_archive/common/constants/dimensions.dart';
import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/common/constants/app_string.dart';
import 'package:coral_memory_archive/common/constants/font_size.dart';
import 'package:coral_memory_archive/common/constants/font_weight.dart';
import 'package:coral_memory_archive/common/utils/picked_image_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MemoryFormPage extends StatefulWidget {
  final CoralMemoryFragment? memory;

  const MemoryFormPage({super.key, this.memory});

  @override
  State<MemoryFormPage> createState() => _MemoryFormPageState();
}

class _MemoryFormPageState extends State<MemoryFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _speciesController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedCategory;
  DateTime _discoveredAt = DateTime.now();
  String _selectedImagePath = '';

  @override
  void initState() {
    super.initState();

    final memory = widget.memory;

    if (memory != null) {
      _titleController.text = memory.title;
      _speciesController.text = memory.species;
      _locationController.text = memory.location;
      _descriptionController.text = memory.description;

      _selectedCategory = memory.category;
      _discoveredAt = memory.discoveredAt;
      _selectedImagePath = memory.imageUrl;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _speciesController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _discoveredAt,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && mounted) {
      setState(() {
        _discoveredAt = selectedDate;
      });
    }
  }

  Future<void> _selectImage() async {
    try {
      final selectedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        requestFullMetadata: false,
      );
      if (selectedImage == null) return;

      final savedImagePath = await persistPickedImage(selectedImage);

      if (!mounted) return;
      setState(() {
        _selectedImagePath = savedImagePath;
      });
    } catch (error, stackTrace) {
      debugPrint('Image selection failed: $error\n$stackTrace');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.error,
          content: CustomText(
            model: CustomTextModel(
              text: '${AppStrings.imageSelectionError}\n$error',
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.normal,
              color: AppColors.textPrimary,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      );
    }
  }

  void _saveMemory() {
    if (!_formKey.currentState!.validate()) return;

    final memory = CoralMemoryFragment(
      id: widget.memory?.id ?? 0,
      title: _titleController.text.trim(),
      species: _speciesController.text.trim(),
      category: _selectedCategory!,
      imageUrl: _selectedImagePath,
      discoveredAt: _discoveredAt,
      location: _locationController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    context.read<CoralMemoryCubit>().saveMemory(memory);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoralMemoryCubit, CoralMemoryState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          (current.status == CoralMemoryStatus.success ||
              current.status == CoralMemoryStatus.error),
      listener: (context, state) {
        if (state.status == CoralMemoryStatus.success) {
          Navigator.of(context).pop();
        } else if (state.status == CoralMemoryStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.error,
              content: CustomText(
                model: CustomTextModel(
                  text: state.errorMessage ?? AppStrings.saveMemoryError,
                  fontSize: AppFontSize.small,
                  fontWeight: AppFontWeight.normal,
                  color: AppColors.textPrimary,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            model: CustomTextModel(
              text: AppStrings.addMemory,
              fontSize: AppFontSize.medium,
              fontWeight: AppFontWeight.bold,
              color: AppColors.textPrimary,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView.separated(
            padding: const EdgeInsets.all(AppDimensions.spacingMedium),
            itemCount: 8,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppDimensions.spacingMedium),
            itemBuilder: (context, index) => <Widget>[
              CustomTextField(
                model: CustomTextFieldModel(
                  hintText: AppStrings.titleHint,
                  labelText: AppStrings.titleLabel,
                  controller: _titleController,
                  maxLength: AppDimensions.textFieldMaxLength,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.titleRequiredError;
                    }
                    return null;
                  },
                ),
              ),
              CustomTextField(
                model: CustomTextFieldModel(
                  hintText: AppStrings.speciesHint,
                  labelText: AppStrings.speciesLabel,
                  controller: _speciesController,
                  maxLength: AppDimensions.textFieldMaxLength,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.speciesRequiredError;
                    }
                    return null;
                  },
                ),
              ),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: AppStrings.categoryLabel,
                  filled: true,
                  fillColor: AppColors.surface.withValues(
                    alpha: AppDimensions.textFieldFillOpacity,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingMedium,
                    vertical: AppDimensions.spacingMedium,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.textFieldBorderRadius),
                    ),
                    borderSide: BorderSide(color: AppColors.outline),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.textFieldBorderRadius),
                    ),
                    borderSide: BorderSide(color: AppColors.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.textFieldBorderRadius),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: AppDimensions.textFieldFocusBorder,
                    ),
                  ),
                ),
                items: AppStrings.memoryCategories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: CustomText(
                      model: CustomTextModel(
                        text: category,
                        fontSize: AppFontSize.small,
                        fontWeight: AppFontWeight.normal,
                        color: AppColors.textPrimary,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return AppStrings.categoryRequiredError;
                  }
                  return null;
                },
              ),
              CustomTextField(
                model: CustomTextFieldModel(
                  hintText: AppStrings.locationHint,
                  labelText: AppStrings.locationLabel,
                  controller: _locationController,
                  maxLength: AppDimensions.textFieldMaxLength,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.locationRequiredError;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(
                    alpha: AppDimensions.textFieldFillOpacity,
                  ),
                  border: Border.all(color: AppColors.outline),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.textFieldBorderRadius,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingMedium,
                  ),
                  title: CustomText(
                    model: CustomTextModel(
                      text: AppStrings.discoveryDateLabel,
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.textPrimary,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  subtitle: CustomText(
                    model: CustomTextModel(
                      text:
                          '${_discoveredAt.day.toString().padLeft(2, '0')}.'
                          '${_discoveredAt.month.toString().padLeft(2, '0')}.'
                          '${_discoveredAt.year}',
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.normal,
                      color: AppColors.secondaryText,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  trailing: const CustomIcon(
                    model: CustomIconModel(icon: Icons.calendar_month),
                  ),
                  onTap: _selectDate,
                ),
              ),
              CustomTextField(
                model: CustomTextFieldModel(
                  hintText: AppStrings.descriptionHint,
                  labelText: AppStrings.descriptionLabel,
                  controller: _descriptionController,
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.descriptionRequiredError;
                    }
                    return null;
                  },
                ),
              ),
              InkWell(
                onTap: _selectImage,
                borderRadius: BorderRadius.circular(
                  AppDimensions.textFieldBorderRadius,
                ),
                child: Container(
                  padding: const EdgeInsets.all(AppDimensions.spacingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(
                      alpha: AppDimensions.textFieldFillOpacity,
                    ),
                    border: Border.all(color: AppColors.outline),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.textFieldBorderRadius,
                    ),
                  ),
                  child: Row(
                    spacing: AppDimensions.spacingMedium,
                    children: [
                      const CustomIcon(
                        model: CustomIconModel(
                          icon: Icons.add_photo_alternate_outlined,
                          color: AppColors.aqua,
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          model: CustomTextModel(
                            text: _selectedImagePath.isEmpty
                                ? AppStrings.selectMemoryImage
                                : AppStrings.selectedMemoryImage,
                            fontSize: AppFontSize.small,
                            fontWeight: AppFontWeight.medium,
                            color: AppColors.textPrimary,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                model: CustomButtonModel(
                  text: AppStrings.saveMemory,
                  backgroundColor: AppColors.primary,
                  fontSize: AppFontSize.medium,
                  fontWeight: AppFontWeight.bold,
                  textColor: AppColors.white,
                  onPressed: _saveMemory,
                ),
              ),
            ][index],
          ),
        ),
      ),
    );
  }
}
