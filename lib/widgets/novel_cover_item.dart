import 'package:flutter/material.dart';
import 'package:novel_app/models/novel_model.dart';
import 'package:novel_app/pages/detail_page.dart';
import 'package:novel_app/utils/animated_page_route.dart';
import 'package:novel_app/widgets/cover_image.dart'; // Widget CoverImage kustom kita

class NovelCoverItem extends StatelessWidget {
  final Novel novel;
  const NovelCoverItem({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    // Kita buat tag hero yang unik untuk list "Top"
    final String heroTag = 'top-${novel.id}';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          AnimatedPageRoute(
            page: DetailPage(
              novel: novel,
              heroTag: heroTag, // Kirim tag unik ini ke DetailPage
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        width: 130, // Lebar item
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gunakan widget CoverImage kita
              CoverImage(
                heroTag: heroTag, // Gunakan tag unik
                imageUrl: novel.coverImageUrl,
                width: 130,
                height: 180,
              ),
              const SizedBox(height: 8),
              Text(
                novel.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}