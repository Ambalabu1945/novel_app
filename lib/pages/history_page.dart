import 'package:flutter/material.dart';
import 'package:novel_app/utils/dummy_books.dart';
import 'package:novel_app/widgets/novel_cart.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ini hanya data dummy.
    // Untuk data asli, Anda harus membuat sistem history di UserSession
    final historyNovels = [dummyNovels[1], dummyNovels[2]];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading History'),
      ),
      body: historyNovels.isEmpty
          ? const Center(
              child: Text('Anda belum membaca novel apapun.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: historyNovels.length,
              itemBuilder: (context, index) {
                final novel = historyNovels[index];
                return NovelCart(novel: novel);
              },
            ),
    );
  }
}