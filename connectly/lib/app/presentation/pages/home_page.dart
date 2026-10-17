import 'package:connectly/app/common/constants/app_strings.dart';
import 'package:connectly/app/common/constants/colors.dart';
import 'package:connectly/app/common/constants/dimensions.dart';
import 'package:connectly/app/common/constants/font_size.dart';
import 'package:connectly/app/common/constants/font_weight.dart';
import 'package:connectly/app/common/widgets/custom_text.dart';
import 'package:connectly/app/presentation/blocs/cubits/users_cubit.dart';
import 'package:connectly/app/presentation/models/custom_text_model.dart';
import 'package:connectly/app/presentation/models/users_state.dart';
import 'package:connectly/app/presentation/widgets/add_user_form.dart';
import 'package:connectly/app/presentation/widgets/custom_user_card.dart';
import 'package:connectly/app/data/datasources/remote/user_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(UserRemoteDataSource())..getUsers(),
      child: Builder(
        builder: (context) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          title: CustomText(
            model: CustomTextModel(
              text: AppStrings.appTitle,
              fontSize: AppFontSize.large,
              fontWeight: AppFontWeight.bold,
              textAlign: TextAlign.left,
              color: AppColors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: AppDimensions.spacingMedium,
              ),
              child: IconButton(
                onPressed: () {
                  final usersCubit = context.read<UsersCubit>();

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.background,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppDimensions.textFieldBorderRadius),
                      ),
                    ),
                    builder: (context) {
                      return BlocProvider.value(
                        value: usersCubit,
                        child: const AddUserForm(),
                      );
                    },
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: const CircleBorder(),
                ),
                icon: const Icon(Icons.add, color: AppColors.primary),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMedium),
          child: Column(
            spacing: AppDimensions.spacingSmall,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                model: CustomTextModel(
                  text: AppStrings.homePageTitle,
                  fontSize: AppFontSize.large,
                  fontWeight: AppFontWeight.bold,
                  textAlign: TextAlign.left,
                  color: AppColors.text,
                ),
              ),
              CustomText(
                model: CustomTextModel(
                  text: AppStrings.homePageSubtitle,
                  fontSize: AppFontSize.small,
                  fontWeight: AppFontWeight.normal,
                  textAlign: TextAlign.left,
                  color: AppColors.secondaryText,
                ),
              ),
              Expanded(
                child: BlocBuilder<UsersCubit, UsersState>(
                  builder: (context, state) {
                    if (state is UsersLoading || state is UsersInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }

                    if (state is UsersError) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppDimensions.spacingMedium,
                          children: [
                            CustomText(
                              model: CustomTextModel(
                                text: state.message,
                                fontSize: AppFontSize.small,
                                fontWeight: AppFontWeight.normal,
                                color: AppColors.error,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<UsersCubit>().getUsers();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.error,
                              ),
                              child: CustomText(
                                model: CustomTextModel(
                                  text: AppStrings.tryAgain,
                                  fontSize: AppFontSize.small,
                                  fontWeight: AppFontWeight.normal,
                                  color: AppColors.white,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is UsersLoaded) {
                      return ListView.separated(
                        itemCount: state.users.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: AppDimensions.spacingMedium),
                        itemBuilder: (context, index) {
                          return CustomUserCard(user: state.users[index]);
                        },
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
      ),
    );
  }
}
