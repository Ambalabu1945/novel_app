import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                book.coverUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Title & author
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'by ${book.author}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),

            // Genre, rating, release
            Row(
              children: [
                Chip(
                  label: Text(book.genre),
                  backgroundColor: Colors.deepPurple,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      book.rating.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  book.releaseDate,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Synopsis
            Text(
              book.synopsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            // Cover artist
            Text(
              '🎨 Cover by ${book.coverArtist}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.deepPurpleAccent,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      book.markAsRead();
                      Navigator.pushNamed(context, '/reader', arguments: book);
                    },
                    icon: const Icon(Icons.menu_book),
                    label: const Text('READ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(
                    book.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: book.isFavorite ? Colors.redAccent : Colors.white,
                  ),
                  onPressed: () {
                    book.toggleFavorite();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(book.isFavorite
                            ? 'Added to favorites ❤️'
                            : 'Removed from favorites'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
