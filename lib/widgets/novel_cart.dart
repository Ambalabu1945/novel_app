import 'package:flutter/material.dart';
import 'package:novel_app/models/novel_model.dart';
import 'package:novel_app/pages/detail_page.dart';
import 'package:novel_app/utils/animated_page_route.dart';
import 'package:novel_app/widgets/cover_image.dart';

class NovelCart extends StatelessWidget {
  final Novel novel;
  const NovelCart({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    // Tentukan tag hero yang unik
    final String heroTag = 'all-${novel.id}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            // --- KIRIM HERO TAG ---
            AnimatedPageRoute(
              page: DetailPage(novel: novel, heroTag: heroTag),
            ),
            // --- BATAS PERUBAHAN ---
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoverImage(
                // --- GUNAKAN HERO TAG ---
                heroTag: heroTag,
                // --- BATAS PERUBAHAN ---
                imageUrl: novel.coverImageUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        novel.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        novel.author,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(novel.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}