import 'package:flutter/material.dart';

// Widget kustom (OOP) yang menggabungkan Hero, ClipRRect, dan Image
class CoverImage extends StatelessWidget {
  final String heroTag; // Tag untuk animasi Hero
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CoverImage({
    super.key,
    required this.heroTag,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // --- ANIMASI SMOOTH (Hero) ---
    return Hero(
      tag: heroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0), // Desain bagus
        child: Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }
}