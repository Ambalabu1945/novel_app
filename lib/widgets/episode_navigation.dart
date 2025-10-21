import 'package:flutter/material.dart';

class EpisodeNavigation extends StatelessWidget {
  // Ubah tipe data, sekarang bisa null
  final VoidCallback? onPrevious; 
  final VoidCallback? onNext;
  final VoidCallback onChapterList;

  const EpisodeNavigation({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.onChapterList,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            // Jika onPressed null, tombol akan otomatis disabled (warna abu-abu)
            onPressed: onPrevious, 
            tooltip: 'Previous Chapter',
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: onChapterList,
            tooltip: 'Chapter List',
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: onNext, // Otomatis disabled jika null
            tooltip: 'Next Chapter',
          ),
        ],
      ),
    );
  }
}