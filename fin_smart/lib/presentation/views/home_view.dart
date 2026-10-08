import 'package:fin_smart/constants/colors.dart';
import 'package:fin_smart/constants/dimensions.dart';
import 'package:fin_smart/presentation/models/custom_container_model.dart';
import 'package:fin_smart/presentation/models/custom_text_model.dart';
import 'package:fin_smart/presentation/widgets/custom_account_card.dart';
import 'package:fin_smart/presentation/widgets/custom_action_card.dart';
import 'package:fin_smart/presentation/widgets/custom_container.dart';
import 'package:fin_smart/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:fin_smart/presentation/widgets/custom_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(),
                const SizedBox(height: 40),

                CustomContainer(
                  model: CustomContainerModel(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    color: darkGreen,
                    borderRadius: borderRadius,
                    gradient: const LinearGradient(
                      colors: [darkGreen, green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: darkGreen.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        model: CustomTextModel(
                          text: 'TOTAL BALANCE',
                          fontSize: subtitle,
                          fontWeight: FontWeight.normal,
                          color: white,
                          textAlign: TextAlign.left,
                        ),
                      ),

                      CustomText(
                        model: CustomTextModel(
                          text: '₺48,250.00',
                          fontSize: balance,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                CustomText(
                  model: CustomTextModel(
                    text: 'MY ACCOUNTS',
                    fontSize: headerTitleFontSzie,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 24),
                const CustomAccountCard(
                  accountName: 'Checking Account',
                  balance: '₺18,500.00',
                  icon: Icons.account_balance_outlined,
                ),

                const SizedBox(height: 12),

                const CustomAccountCard(
                  accountName: 'Savings Account',
                  balance: '₺29,750.00',
                  icon: Icons.savings_outlined,
                ),

                const SizedBox(height: 36),

                CustomText(
                  model: CustomTextModel(
                    text: 'QUICK ACTIONS',
                    fontSize: headerTitleFontSzie,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Flexible(
                      child: CustomActionCard(
                        title: 'Expense',
                        icon: Icons.add,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: CustomActionCard(
                        title: 'Transfer',
                        icon: Icons.swap_horiz,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
