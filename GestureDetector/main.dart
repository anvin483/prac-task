import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageGalleryScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({super.key});

  // 🖼️ List of placeholder image URLs
  final List<String> imageUrls = const [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHyugpGdcnM1LyDG9gHFJDKhOg1bZ7fzRM-ImQVKMlpi7Q3R59uRltCn0lQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnstO3z8OWzF5XGsvCXUgwx7tluIkeU_NqdfffptAUFMPzSBhIfySl3uVRKKQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyCHxvRi1Xful2NxJANH5I-cirnrv5OB8DMrLzQQWzUiEc71IezKPRHA203oY&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQInlVHWGXA6_UX53aj456Ukcwuij44vks7C96LzUvbBk8VtGf6bgjzuwJZhA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTIS46V8Lz60LSQvdrB4xhLQ0U0MRS-kjyIyL8YxQWT-6Y3ZhNI8sceaR3gg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVXu0haDyXjNUoCPyNwfYpGTDMvyqguzMIDrFv7YdT8SdSXXWgj3DScVQokQ&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Gallery"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 images per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final imageUrl = imageUrls[index];
            return GestureDetector(
              onTap: () {
                // Navigate to full-screen view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImageScreen(imageUrl: imageUrl, index: index),
                  ),
                );
              },
              child: Hero(
                tag: "imageHero_$index",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  final String imageUrl;
  final int index;

  const FullScreenImageScreen({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // tap anywhere to go back
        child: Center(
          child: Hero(
            tag: "imageHero_$index",
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.8,
              maxScale: 4.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

