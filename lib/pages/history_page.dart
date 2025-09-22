import 'package:flutter/material.dart';
import '../utils/dummy_books.dart';
import '../models/book.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> readBooks =
        dummyBooks.where((book) => book.isRead).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Reading History'),
      ),
      body: readBooks.isEmpty
          ? const Center(
              child: Text(
                'You haven’t read anything yet 📭',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: readBooks.length,
              itemBuilder: (context, index) {
                final book = readBooks[index];
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
                                Text(
                                  'Last read: Chapter 1',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
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
