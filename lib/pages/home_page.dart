import 'package:flutter/material.dart';
// Ganti 'novel_app' dengan nama project Anda
import 'package:novel_app/pages/favorites_page.dart'; 
import 'package:novel_app/pages/profile_page.dart';
import 'package:novel_app/widgets/bottom_navbar.dart';
import 'package:novel_app/pages/home_tab_page.dart';

// HomePage akan menjadi 'Shell' atau 'Host' untuk navigasi utama
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan oleh BottomNavbar
  static const List<Widget> _pages = <Widget>[
    HomeTabPage(), // Halaman Home sesungguhnya
    FavoritesPage(), // Halaman Favorit
    ProfilePage(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // --- INI ADALAH PERBAIKANNYA ---
      // Kita ganti 'IndexedStack' dengan cara ini
      // agar halaman di-build ulang (refresh) setiap kali tab diganti.
      body: _pages[_selectedIndex],
      // 
      // Hapus kode ini:
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: _pages,
      // ),
      // --- BATAS PERBAIKAN ---

      // Menggunakan widget BottomNavbar kustom Anda
      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}