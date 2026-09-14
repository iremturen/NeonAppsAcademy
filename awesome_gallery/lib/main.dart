import 'package:flutter/material.dart';
import 'widgets/gallery_item.dart';

final List<String> images = [
  "assets/images/2435.jpg",
  "assets/images/2566.jpg",
  "assets/images/7259.jpg",
  "assets/images/atam.jpg",
  "assets/images/bday.jpg",
  "assets/images/beach.jpg",
  "assets/images/breakfast.jpg",
  "assets/images/cafe.jpg",
  "assets/images/cat.jpg",
  "assets/images/cat_black.jpg",
  "assets/images/cini.jpg",
  "assets/images/city.jpg",
  "assets/images/dog.jpg",
  "assets/images/friend.jpg",
  "assets/images/istanbul.jpg",
  "assets/images/istanbul2.jpg",
  "assets/images/lamp.jpg",
  "assets/images/magnet.jpg",
  "assets/images/movie.jpg",
  "assets/images/sarman.jpg",
  "assets/images/view.jpg",
  "assets/images/wallpaper.jpg",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,

        // Eski AppBar düzenin aynen korundu
        appBar: selectedImage == null
            ? AppBar(
                backgroundColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                toolbarHeight: 80,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Awesome Gallery",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ".SF Pro Display",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${images.length}  photos",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,

        body: selectedImage == null
            ? GridView.builder(
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GalleryItem(
                    imagePath: images[index],
                    onTap: (image) {
                      setState(() {
                        selectedImage = image;
                      });
                    },
                  );
                },
              )
            : Container(
                color: Colors.black,
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    // Resim kırpılmadan ve boyutu bozulmadan ortalanır
                    Center(
                      child: Image.asset(
                        selectedImage!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Sol üstteki geri butonu (Çentiğe girmemesi için safe area ve margin ile ayarlandı)
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedImage = null;
                              });
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
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