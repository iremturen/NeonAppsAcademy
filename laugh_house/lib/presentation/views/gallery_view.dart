import 'package:flutter/material.dart';
import 'package:laugh_house/constants/dimensions.dart';
import 'package:laugh_house/data/memories.dart';
import 'package:laugh_house/presentation/widgets/custom_page_app_bar.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPageAppBar(title: 'EVENT GALLERY'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: memories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppDimensions.galleryGridCrossAxisCount,
                    crossAxisSpacing: AppDimensions.smallSpacing + 4,
                    mainAxisSpacing: AppDimensions.smallSpacing + 4,
                    childAspectRatio: AppDimensions.galleryGridChildAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.borderRadius,
                      ),
                      child: Image.network(
                        memories[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
