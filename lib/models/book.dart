import 'base_content.dart';

class Book extends BaseContent {
  final double _rating;
  bool _isFavorite;
  bool _isRead;
  final String _content;
  final int _chapterCount;
  final String _releaseDate;
  final String _coverArtist;

  Book({
    required String title,
    required String author,
    required String genre,
    required String coverUrl,
    required String synopsis,
    required double rating,
    required bool isFavorite,
    required bool isRead,
    required String content,
    required int chapterCount,
    required String releaseDate,
    required String coverArtist,
  })  : _rating = rating,
        _isFavorite = isFavorite,
        _isRead = isRead,
        _content = content,
        _chapterCount = chapterCount,
        _releaseDate = releaseDate,
        _coverArtist = coverArtist,
        super(
          title: title,
          author: author,
          genre: genre,
          coverUrl: coverUrl,
          synopsis: synopsis,
        );

  // Getters
  double get rating => _rating;
  bool get isFavorite => _isFavorite;
  bool get isRead => _isRead;
  String get content => _content;
  int get chapterCount => _chapterCount;
  String get releaseDate => _releaseDate;
  String get coverArtist => _coverArtist;

  // Setters
  set isFavorite(bool value) => _isFavorite = value;
  set isRead(bool value) => _isRead = value;

  // Polymorphic override
  @override
  String displayInfo() {
    return '''
📖 $title by $author
🎭 Genre: $genre
⭐ Rating: ${_rating.toStringAsFixed(1)}
📅 Released: $releaseDate
🎨 Cover by: $coverArtist
📚 Chapters: $chapterCount
❤️ Favorite: $_isFavorite
✅ Read: $_isRead
''';
  }

  // Utility
  String shortPreview() {
    return _content.length > 120 ? '${_content.substring(0, 120)}...' : _content;
  }

  void markAsRead() => _isRead = true;
  void toggleFavorite() => _isFavorite = !_isFavorite;
}
