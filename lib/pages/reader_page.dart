import 'package:flutter/material.dart';
import 'package:novel_app/widgets/episode_navigation.dart';

class ReaderPage extends StatefulWidget {
  const ReaderPage({super.key});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  // --- KONTROL HALAMAN (BARU) ---
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  // --- BATAS KONTROL ---

  double _fontSize = 16.0;

  // Data dummy untuk 3 chapter
  final List<Map<String, String>> chapters = [
    {
      'title': 'Chapter 1: The Beginning',
      'content': 'Ini adalah isi dari Chapter 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ... ' * 50,
    },
    {
      'title': 'Chapter 2: The Forest',
      'content': 'Ini adalah chapter 2, petualangan dimulai. Sed ut perspiciatis unde omnis iste natus error sit voluptatem. ... ' * 50,
    },
    {
      'title': 'Chapter 3: The Discovery',
      'content': 'Ini adalah chapter 3, mereka menemukan sesuatu. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. ... ' * 50,
    }
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // --- FUNGSI GANTI HALAMAN (BARU) ---
  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
  // --- BATAS FUNGSI ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar ganti sesuai chapter
        title: Text(chapters[_currentPage]['title']!),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsDialog,
          )
        ],
      ),
      // --- GUNAKAN PAGEVIEW ---
      body: PageView.builder(
        controller: _pageController,
        itemCount: chapters.length,
        onPageChanged: (int page) {
          // Update judul AppBar saat di-swipe
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              chapters[index]['content']!,
              style: TextStyle(
                fontSize: _fontSize,
                height: 1.5,
              ),
            ),
          );
        },
      ),
      // --- BATAS PAGEVIEW ---

      // --- Hubungkan Tombol ke PageView ---
      bottomNavigationBar: EpisodeNavigation(
        // Nonaktifkan tombol jika di halaman pertama
        onPrevious: _currentPage == 0 ? null : () {
          _goToPage(_currentPage - 1);
        },
        // Nonaktifkan tombol jika di halaman terakhir
        onNext: _currentPage == chapters.length - 1 ? null : () {
          _goToPage(_currentPage + 1);
        },
        onChapterList: () {
          print('Show Chapter List');
        },
      ),
    );
  }

  void _showSettingsDialog() {
    // ... (Fungsi ini tetap sama, tapi kita perlu perbaiki state management-nya)
    
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Gunakan StatefulBuilder agar slider bisa di-update
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Font Size: ${_fontSize.toInt()}'),
                  Slider(
                    value: _fontSize,
                    min: 12.0,
                    max: 30.0,
                    divisions: 18,
                    label: _fontSize.round().toString(),
                    onChanged: (double value) {
                      // Update font di halaman dan di modal
                      setState(() {
                        _fontSize = value;
                      });
                      setModalState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}