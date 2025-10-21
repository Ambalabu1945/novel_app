import 'package:flutter/material.dart';
import 'package:novel_app/models/novel_model.dart';
import 'package:novel_app/utils/dummy_books.dart';
import 'package:novel_app/utils/user_session.dart';
import 'package:novel_app/widgets/novel_cart.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Hapus list _favoriteNovels dari sini

  // --- INI PERBAIKANNYA ---
  // Kita tidak pakai initState, tapi langsung ambil data di dalam build
  // agar datanya selalu terbaru setiap kali tab ini dibuka.
  List<Novel> _loadFavorites() {
    final favIds = UserSession().getFavorites();
    return dummyNovels.where((novel) {
      return favIds.contains(novel.id);
    }).toList();
  }
  // --- BATAS PERBAIKAN ---

  @override
  Widget build(BuildContext context) {
    // Panggil fungsi _loadFavorites() SETIAP KALI build
    final List<Novel> favoriteNovels = _loadFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: favoriteNovels.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Anda belum memiliki novel favorit.'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favoriteNovels.length,
              itemBuilder: (context, index) {
                final novel = favoriteNovels[index];
                return NovelCart(novel: novel);
              },
            ),
    );
  }
}