import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const CoverImage({
    super.key,
    required this.imageUrl,
    this.width = 100,
    this.height = 140,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
