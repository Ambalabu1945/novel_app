import 'package:flutter/material.dart';
import '../utils/dummy_books.dart';
import '../models/book.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> favoriteBooks =
        dummyBooks.where((book) => book.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('My Favorites'),
      ),
      body: favoriteBooks.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet 💔',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: book);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        // Cover
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          child: Image.asset(
                            book.coverUrl,
                            width: 100,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Info
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'by ${book.author}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      book.rating.toStringAsFixed(1),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
