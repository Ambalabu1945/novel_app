import 'package:flutter/material.dart';

class GenreFilter extends StatelessWidget {
  final List<String> genres;
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const GenreFilter({
    super.key,
    required this.genres,
    required this.selectedGenre,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = genre == selectedGenre;

          return GestureDetector(
            onTap: () => onGenreSelected(genre),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepPurple : Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                genre,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[300],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
