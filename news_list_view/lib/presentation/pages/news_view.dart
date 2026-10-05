import 'package:flutter/material.dart';
import 'package:news_list_view/constants/colors.dart';
import 'package:news_list_view/data/news_data.dart';
import 'package:news_list_view/presentation/models/custom_container_model.dart';
import 'package:news_list_view/presentation/models/custom_text_model.dart';
import 'package:news_list_view/presentation/widgets/custom_app_bar.dart';

import 'package:news_list_view/presentation/widgets/custom_container.dart';
import 'package:news_list_view/presentation/widgets/custom_news_card.dart';
import 'package:news_list_view/presentation/widgets/custom_text.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              model: CustomTextModel(
                text: 'Latest News',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: CustomContainer(
                model: const CustomContainerModel(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  borderRadius: 16,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    final news = newsData[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: NewsCard(
                        imagePath: news.imagePath,
                        title: news.title,
                        subtitle: news.subtitle,
                      ),
                    );
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