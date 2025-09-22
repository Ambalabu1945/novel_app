abstract class BaseContent {
  final String _title;
  final String _author;
  final String _genre;
  final String _coverUrl;
  final String _synopsis;

  BaseContent({
    required String title,
    required String author,
    required String genre,
    required String coverUrl,
    required String synopsis,
  })  : _title = title,
        _author = author,
        _genre = genre,
        _coverUrl = coverUrl,
        _synopsis = synopsis;

  // Getters
  String get title => _title;
  String get author => _author;
  String get genre => _genre;
  String get coverUrl => _coverUrl;
  String get synopsis => _synopsis;

  // Polymorphic method
  String displayInfo();
}
