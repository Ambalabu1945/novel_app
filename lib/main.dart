import 'package:flutter/material.dart';
// Ganti 'novel_app' dengan nama project Anda jika berbeda
import 'package:novel_app/pages/splash_screen.dart'; 
import 'package:novel_app/utils/user_session.dart';

Future<void> main() async {
  // Pastikan binding Flutter sudah siap
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi UserSession (shared_preferences) sebelum app berjalan
  await UserSession().init(); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Skema warna baru yang lebih bagus dan kontras
    final ColorScheme kColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.amber, // Warna aksen utama
      brightness: Brightness.dark,
      background: const Color(0xFF121212), // Background charcoal
      surface: const Color(0xFF1E1E1E), // Warna untuk Card & Appbar
    );

    return MaterialApp(
      title: 'Novel App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        
        // Tampilan AppBar yang konsisten
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.surface, // Warna AppBar
          centerTitle: true,
          elevation: 0,
        ), // <-- Koma pemisah

        // Tampilan Card yang baru (sudah diperbaiki)
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),

        // Tampilan Tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary, // Warna tombol
            foregroundColor: kColorScheme.onPrimary, // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        
      ), // <-- Kurung tutup untuk ThemeData
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Mulai dari Splash Screen
    );
  }
}