import 'package:flutter/material.dart';

class GenreFilter extends StatefulWidget {
  final List<String> allGenres;
  final Function(String?) onGenreSelected;

  const GenreFilter({
    super.key,
    required this.allGenres,
    required this.onGenreSelected,
  });

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  String? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.allGenres.length + 1, // +1 untuk "All"
        itemBuilder: (context, index) {
          final bool isAllCategory = index == 0;
          final String genre = isAllCategory ? 'All' : widget.allGenres[index - 1];
          final bool isSelected = _selectedGenre == genre || (_selectedGenre == null && isAllCategory);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(genre),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _selectedGenre = isAllCategory ? null : genre;
                    widget.onGenreSelected(_selectedGenre);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}