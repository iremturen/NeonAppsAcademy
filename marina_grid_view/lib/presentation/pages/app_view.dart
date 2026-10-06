import 'package:flutter/material.dart';

import 'package:marina_grid_view/constants/colors.dart';
import 'package:marina_grid_view/constants/dimensions.dart';
import 'package:marina_grid_view/data/app_data.dart';
import 'package:marina_grid_view/presentation/models/custom_app_bar_model.dart';
import 'package:marina_grid_view/presentation/widgets/app_card.dart';
import 'package:marina_grid_view/presentation/widgets/custom_app_bar.dart';

class AppsView extends StatefulWidget {
  const AppsView({super.key});

  @override
  State<AppsView> createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  Future<void> _refreshApps() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: CustomAppBar(
        model: CustomAppBarModel(
          backgroundColor: cream,
          height: appBarHeight,
          title: 'Neon Apps Projects',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshApps,
        color: salmon,
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridRowItemCount,
            crossAxisSpacing: gridSpacing,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: appData.length,
          itemBuilder: (context, index) {
            return AppCard(
              app: appData[index],
              onTap: () {
                setState(() {
                  appData[index].isSelect = !appData[index].isSelect;
                });
              },
            );
          },
        ),
      ),
    );
  }
}