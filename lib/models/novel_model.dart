import 'base_content.dart';

class NovelModel extends BaseContent {
  final List<String> _tags;
  final String _status; // e.g. 'Ongoing', 'Completed'
  final int _views;

  NovelModel({
    required String title,
    required String author,
    required String genre,
    required String coverUrl,
    required String synopsis,
    required List<String> tags,
    required String status,
    required int views,
  })  : _tags = tags,
        _status = status,
        _views = views,
        super(
          title: title,
          author: author,
          genre: genre,
          coverUrl: coverUrl,
          synopsis: synopsis,
        );

  // Getters
  List<String> get tags => _tags;
  String get status => _status;
  int get views => _views;

  // Polymorphic override
  @override
  String displayInfo() {
    return '''
📖 $title by $author
🎭 Genre: $genre
🏷️ Tags: ${_tags.join(', ')}
📊 Views: $_views
📌 Status: $_status
''';
  }

  // Utility
  bool isPopular() => _views > 10000;
  bool isCompleted() => _status.toLowerCase() == 'completed';
}
