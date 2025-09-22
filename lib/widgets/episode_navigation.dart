import 'package:flutter/material.dart';

class EpisodeNavigation extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final int currentEpisode;
  final int totalEpisodes;

  const EpisodeNavigation({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.currentEpisode,
    required this.totalEpisodes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Episode $currentEpisode of $totalEpisodes',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: onPrevious,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: onNext,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
