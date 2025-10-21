import 'package:flutter/material.dart';
import 'package:novel_app/models/novel_model.dart';
// Ganti 'novel_app' dengan nama project Anda
import 'package:novel_app/utils/dummy_books.dart'; 
import 'package:novel_app/widgets/main_drawer.dart';
import 'package:novel_app/widgets/novel_cart.dart';
import 'package:novel_app/widgets/novel_cover_item.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil 5 novel untuk bagian "Top Novels"
    final List<Novel> topNovels = dummyNovels.take(5).toList();

    return Scaffold(
      drawer: const MainDrawer(), // Menu "garis tiga"
      appBar: AppBar(
        title: const Text('Novel Library'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Bagian "Top 5 Novels" ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Top 5 Novels',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              // --- DIPERBAIKI: Error Overflow ---
              // Tingginya kita tambah dari 220 menjadi 240
              // untuk memberi ruang bagi padding dan teks.
              height: 240, 
              // --- BATAS PERBAIKAN ---
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                itemCount: topNovels.length, // <-- Ini sudah 5
                itemBuilder: (context, index) {
                  return NovelCoverItem(novel: topNovels[index]);
                },
              ),
            ),
            
            // --- Bagian "Trending" ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                // --- DIPERBAIKI: Ganti Teks ---
                'Trending', // <-- Diubah dari 'All Novels'
                // --- BATAS PERBAIKAN ---
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            // ListView vertikal
            ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dummyNovels.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final novel = dummyNovels[index];
                return NovelCart(novel: novel);
              },
            ),
          ],
        ),
      ),
    );
  }
}