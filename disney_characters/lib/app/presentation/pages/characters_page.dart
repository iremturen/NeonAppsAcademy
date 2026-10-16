import 'package:disney_characters/app/common/constants/app_strings.dart';
import 'package:disney_characters/app/common/constants/colors.dart';
import 'package:disney_characters/app/common/constants/dimensions.dart';
import 'package:disney_characters/app/common/constants/font_size.dart';
import 'package:disney_characters/app/common/constants/font_weight.dart';
import 'package:disney_characters/app/common/constants/images.dart';
import 'package:disney_characters/app/presentation/pages/character_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/di/injection_container.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text.dart';
import '../../presentation/models/custom_button_model.dart';
import '../../presentation/models/custom_text_model.dart';
import '../blocs/cubits/characters_cubit.dart';
import '../blocs/cubits/characters_state.dart';
import '../widgets/custom_character_card.dart';
import '../models/character_card_model.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // CharactersCubit'i oluşturur ve alt widget'ların erişimine açar.
      create: (_) => InjectionContainer.createCharactersCubit()
        // Cubit oluşturulduktan hemen sonra API isteğini başlatır.
        ..fetchCharacters(),
      // Cubit'i kullanacak olan ekranı oluşturur.
      child: const CharactersView(),
    );
  }
}

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          model: const CustomTextModel(
            text: AppStrings.appTitle,
            fontSize: AppFontSize.big,
            fontWeight: AppFontWeight.bold,
            textAlign: TextAlign.left,
          ),
        ),
        flexibleSpace: Image.asset(AppImages.glitters, fit: BoxFit.cover),
      ),

      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return Center(
              child: Column(
                spacing: AppDimensions.spacingMedium,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: AppColors.primary),
                  CustomText(
                    model: const CustomTextModel(
                      text: AppStrings.loadingCharacters,
                      fontSize: AppFontSize.medium,
                      color: AppColors.secondaryText,
                      fontWeight: AppFontWeight.medium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is CharactersError) {
            return Center(
              child: Column(
                spacing: AppDimensions.spacingMedium,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    model: CustomTextModel(
                      text: state.message,
                      textAlign: TextAlign.center,
                      fontSize: AppFontSize.medium,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  CustomButton(
                    model: CustomButtonModel(
                      text: AppStrings.tryAgain,
                      onPressed: () {
                        context.read<CharactersCubit>().fetchCharacters();
                      },
                      fontSize: AppFontSize.small,
                      fontWeight: AppFontWeight.medium,
                      textColor: AppColors.background,
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is CharactersSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(AppDimensions.spacingMedium),
              itemCount: state.characters.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    AppDimensions.characterGridMaxCrossAxisExtent,
                crossAxisSpacing: AppDimensions.characterGridCrossAxisSpacing,
                mainAxisSpacing: AppDimensions.characterGridMainAxisSpacing,
                childAspectRatio: AppDimensions.characterGridChildAspectRatio,
              ),
              itemBuilder: (context, index) {
                final character = state.characters[index];

                return CustomCharacterCard(
                  model: CharacterCardModel(character: character),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CharacterDetailPage(
                          model: CharacterCardModel(character: character),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
