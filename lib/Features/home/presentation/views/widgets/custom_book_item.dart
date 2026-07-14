import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CustomBookImage extends StatelessWidget {
  final String?image;
  const CustomBookImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // Gives a clean modern look to the book cover
        child: CachedNetworkImage(
          imageUrl: image ?? '',
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(), // Loading state
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.error_outline,
              size: 30,
              color: Colors.red, // Error state if image fails to load or URL is empty
            ),
          ),
        ),
      ),
    );
  }
}
