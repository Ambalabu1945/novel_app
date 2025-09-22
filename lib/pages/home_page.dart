import 'package:flutter/material.dart';
import '../utils/dummy_books.dart';
import '../widgets/cover_image.dart';
import '../widgets/rating_stars.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MYNOVEL_APP'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => navigateTo('/profile'),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 24),
              const Text(
                'Featured Novels',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyBooks.length,
                  itemBuilder: (context, index) {
                    final book = dummyBooks[index];
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
                            CoverImage(imageUrl: book.coverUrl),
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
                                    RatingStars(rating: book.rating),
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeNavbar(),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome back, Reader 👋',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        children: [
          const ListTile(
            title: Text(
              'Navigation',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white),
            title: const Text('Favorites', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/favorites'),
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white),
            title: const Text('History', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/history'),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout', style: TextStyle(color: Colors.redAccent)),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/favorites');
            break;
          case 2:
            Navigator.pushNamed(context, '/history');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
      ],
    );
  }
}
