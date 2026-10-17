import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/widgets/custom_button.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/common/widgets/custom_text_field.dart';
import 'package:connectly/app/data/models/remote_user_model.dart';
import 'package:connectly/app/presentation/blocs/cubits/users_cubit.dart';
import 'package:connectly/app/presentation/models/custom_button_model.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:connectly/app/presentation/models/custom_text_field_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.spacingLarge,
        AppDimensions.spacingLarge,
        AppDimensions.spacingLarge,
        MediaQuery.of(context).viewInsets.bottom + AppDimensions.spacingLarge,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppDimensions.spacingMedium,
          children: [
            CustomText(
              model: CustomTextModel(
                text: AppStrings.addUserFormTitle,
                fontSize: AppFontSize.large,
                fontWeight: AppFontWeight.bold,
                color: AppColors.text,
                textAlign: TextAlign.left,
              ),
            ),
            CustomTextField(
              model: CustomTextFieldModel(
                hintText: AppStrings.addUserNameHint,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppStrings.addUserNameRequired;
                  }
                  return null;
                },
              ),
            ),
            CustomTextField(
              model: CustomTextFieldModel(
                hintText: AppStrings.addUserEmailHint,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppStrings.addUserEmailRequired;
                  }
                  if (!value.contains('@')) {
                    return AppStrings.addUserEmailInvalid;
                  }
                  return null;
                },
              ),
            ),
            CustomTextField(
              model: CustomTextFieldModel(
                hintText: AppStrings.addUserPhoneHint,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppStrings.addUserPhoneRequired;
                  }

                  if (!RegExp(r'^\+?[0-9\s()-]+$').hasMatch(value.trim())) {
                    return AppStrings.addUserPhoneInvalid;
                  }

                  return null;
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                model: CustomButtonModel(
                  text: AppStrings.addUserSubmitButton,
                  fontSize: AppFontSize.small,
                  fontWeight: AppFontWeight.medium,
                  textColor: AppColors.white,
                  backgroundColor: AppColors.primary,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    final user = RemoteUserModel(
                      id: 0,
                      name: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      phone: _phoneController.text.trim(),
                    );

                    final success = await context.read<UsersCubit>().addUser(
                      user,
                    );
                    if (!context.mounted) return;

                    if (success) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: AppDimensions.waitSecond),
                          backgroundColor: AppColors.success,
                          content: CustomText(
                            model: CustomTextModel(
                              text: AppStrings.addUserSuccessMessage,
                              fontSize: AppFontSize.small,
                              fontWeight: AppFontWeight.normal,
                              textAlign: TextAlign.left,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: AppDimensions.waitSecond),
                          backgroundColor: AppColors.error,
                          content: CustomText(
                            model: CustomTextModel(
                              text: AppStrings.addUserFailureMessage,
                              fontSize: AppFontSize.small,
                              fontWeight: AppFontWeight.normal,
                              textAlign: TextAlign.left,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
