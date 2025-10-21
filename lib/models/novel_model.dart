// Ini adalah Model (blueprint) data kita. Murni OOP.
class Novel {
  final String id;
  final String title;
  final String author;
  final String coverImageUrl; // Path ke assets/images/
  final String description;
  final double rating;
  final List<String> genres;

  Novel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.description,
    required this.rating,
    required this.genres,
  });
}