import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final String imagePath;
  final Function(String)
  onTap; 

  const GalleryItem({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          onTap(imagePath);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: Image.asset(
            imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
