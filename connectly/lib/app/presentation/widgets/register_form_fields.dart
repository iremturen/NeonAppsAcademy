import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/presentation/models/custom_text_field_model.dart';
import 'package:connectly/app/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class RegisterFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController ageController;
  final TextEditingController emailController;
  final TextEditingController addressController;

  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.ageController,
    required this.emailController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimensions.spacingMedium,
      children: [
        CustomFormField(
          title: AppStrings.registerNameLabel,
          isRequired: true,
          textFieldModel: CustomTextFieldModel(
            hintText: AppStrings.registerNameHint,
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return AppStrings.registerNameRequired;
              }
              return null;
            },
          ),
        ),
        CustomFormField(
          title: AppStrings.registerSurnameLabel,
          isRequired: true,
          textFieldModel: CustomTextFieldModel(
            hintText: AppStrings.registerSurnameHint,
            controller: surnameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return AppStrings.registerSurnameRequired;
              }
              return null;
            },
          ),
        ),
        CustomFormField(
          title: AppStrings.registerAgeLabel,
          isRequired: true,
          textFieldModel: CustomTextFieldModel(
            hintText: AppStrings.registerAgeHint,
            controller: ageController,
            keyboardType: TextInputType.number,
            validator: (value) {
              final age = int.tryParse(value?.trim() ?? '');

              if (age == null || age <= 0 || age > 120) {
                return AppStrings.registerAgeInvalid;
              }
              return null;
            },
          ),
        ),
        CustomFormField(
          title: AppStrings.registerEmailLabel,
          isRequired: true,
          textFieldModel: CustomTextFieldModel(
            hintText: AppStrings.registerEmailHint,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final email = value?.trim() ?? '';

              if (email.isEmpty) {
                return AppStrings.registerEmailRequired;
              }

              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                  .hasMatch(email)) {
                return AppStrings.registerEmailInvalid;
              }

              return null;
            },
          ),
        ),
        CustomFormField(
          title: AppStrings.registerAddressLabel,
          textFieldModel: CustomTextFieldModel(
            hintText: AppStrings.registerAddressOptionalHint,
            controller: addressController,
            keyboardType: TextInputType.streetAddress,
          ),
        ),
      ],
    );
  }
}
