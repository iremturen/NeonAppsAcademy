import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/widgets/custom_button.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/data/datasources/local/user_local_data_source.dart';
import 'package:connectly/app/data/models/user_model.dart';
import 'package:connectly/app/presentation/models/custom_button_model.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:connectly/app/presentation/pages/home_page.dart';
import 'package:connectly/app/presentation/widgets/register_form_fields.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  final UserLocalDataSource _userLocalDataSource = UserLocalDataSource();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = UserModel(
      name: _nameController.text.trim(),
      surname: _surnameController.text.trim(),
      age: int.parse(_ageController.text.trim()),
      email: _emailController.text.trim(),
      address: _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim(),
    );

    try {
      await _userLocalDataSource.insertUser(user);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: AppDimensions.waitSecond),
          backgroundColor: AppColors.success,
          content: CustomText(
            model: CustomTextModel(
              text: AppStrings.registerSuccessMessage,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.normal,
              textAlign: TextAlign.left,
              color: AppColors.white,
            ),
          ),
        ),
      );

      await Future.delayed(const Duration(seconds: AppDimensions.waitSecond));

      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    } 
    catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.error,
          content: CustomText(
            model: CustomTextModel(
              text: AppStrings.registerFailureMessage,
              fontSize: AppFontSize.small,
              fontWeight: AppFontWeight.normal,
              textAlign: TextAlign.left,
              color: AppColors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.background,
        title: CustomText(
          model: CustomTextModel(
            text: AppStrings.register,
            fontSize: AppFontSize.large,
            fontWeight: AppFontWeight.medium,
            textAlign: TextAlign.left,
            color: AppColors.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppDimensions.spacingLarge),
            children: [
              RegisterFormFields(
                nameController: _nameController,
                surnameController: _surnameController,
                ageController: _ageController,
                emailController: _emailController,
                addressController: _addressController,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.registerButtonTopPadding,
                ),
                child: CustomButton(
                  model: CustomButtonModel(
                    text: AppStrings.registerButton,
                    gradient: AppColors.primaryGradient,
                    fontSize: AppFontSize.medium,
                    fontWeight: AppFontWeight.bold,
                    textColor: AppColors.white,
                    onPressed: _registerUser,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
