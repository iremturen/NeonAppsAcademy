import 'package:flutter/material.dart';

import 'package:news_list_view/constants/colors.dart';
import 'package:news_list_view/constants/dimensions.dart';
import 'package:news_list_view/data/news_data.dart';
import 'package:news_list_view/presentation/models/custom_text_model.dart';
import 'package:news_list_view/presentation/widgets/custom_app_bar.dart';
import 'package:news_list_view/presentation/widgets/custom_news_card.dart';
import 'package:news_list_view/presentation/widgets/custom_news_grid_card.dart';
import 'package:news_list_view/presentation/widgets/custom_text.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomText(
                model: CustomTextModel(
                  text: 'Latest News',
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final news = newsData[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: NewsCard(
                  imagePath: news.imagePath,
                  title: news.title,
                  subtitle: news.subtitle,
                ),
              );
            }, childCount: newsData.length),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: CustomText(
                model: CustomTextModel(
                  text: 'More News',
                  fontSize: subtitleFontSize,
                  color: navy,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final news = newsData[index];

                return NewsGridCard(
                  imagePath: news.imagePath,
                  title: news.title,
                  subtitle: news.subtitle,
                );
              }, childCount: newsData.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
