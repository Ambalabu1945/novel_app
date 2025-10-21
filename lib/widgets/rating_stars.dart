import 'package:flutter/material.dart';

// Ini adalah widget kustom (OOP)
class RatingStars extends StatelessWidget {
  final double rating;
  final double starSize;
  
  const RatingStars({
    super.key,
    required this.rating,
    this.starSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min, // Agar row tidak memakan tempat
      children: List.generate(5, (index) {
        if (index < fullStars) {
          // Bintang Penuh
          return Icon(Icons.star, color: Colors.amber, size: starSize);
        } else if (index == fullStars && hasHalfStar) {
          // Bintang Setengah
          return Icon(Icons.star_half, color: Colors.amber, size: starSize);
        } else {
          // Bintang Kosong
          return Icon(Icons.star_border, color: Colors.amber, size: starSize);
        }
      }),
    );
  }
}