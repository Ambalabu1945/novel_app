import 'package:flutter/material.dart';
import 'package:novel_app/models/novel_model.dart';
import 'package:novel_app/pages/reader_page.dart'; // <-- Import Reader
import 'package:novel_app/utils/animated_page_route.dart'; // <-- Import Animasi
import 'package:novel_app/utils/user_session.dart';
import 'package:novel_app/widgets/cover_image.dart'; // <-- Import Cover

class DetailPage extends StatefulWidget {
  final Novel novel;
  // --- PERUBAHAN HERO TAG ---
  final String heroTag; 
  const DetailPage({
    super.key, 
    required this.novel, 
    required this.heroTag, // <-- Tambahkan ini
  });
  // --- BATAS PERUBAHAN ---

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = UserSession().isFavorite(widget.novel.id);
  }

  void _toggleFavorite() async {
    await UserSession().toggleFavorite(widget.novel.id);
    setState(() {
      _isFavorite = UserSession().isFavorite(widget.novel.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite ? 'Ditambahkan ke favorit' : 'Dihapus dari favorit',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView( // Kita ganti agar Appbar bisa collaps
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CoverImage(
                // --- PERUBAHAN HERO TAG ---
                heroTag: widget.heroTag, // <-- Gunakan heroTag dari constructor
                // --- BATAS PERUBAHAN ---
                imageUrl: widget.novel.coverImageUrl,
                width: double.infinity,
                height: 350, // Lebih besar
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: _toggleFavorite,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.novel.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by ${widget.novel.author}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(' ${widget.novel.rating}'),
                      const SizedBox(width: 16),
                      Text(widget.novel.genres.join(', ')),
                    ],
                  ),
                  const Divider(height: 32),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.novel.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  
                  // --- TOMBOL MULAI BACA ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.book),
                      label: const Text('Mulai Baca (Episode 1)'),
                      onPressed: () {
                        // Sekarang bisa diklik
                        Navigator.push(
                          context,
                          AnimatedPageRoute(page: const ReaderPage()),
                        );
                      },
                    ),
                  )
                  // --- BATAS PERUBAHAN ---
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}