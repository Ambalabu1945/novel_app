import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/reader_page.dart';
import 'pages/profille_page.dart';
import 'pages/favorites_page.dart';
import 'pages/history_page.dart';

void main() {
  runApp(const MyNovelApp());
}

class MyNovelApp extends StatelessWidget {
  const MyNovelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYNOVEL_APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/reader': (context) => const ReaderPage(),
        '/profile': (context) => const ProfilePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/history': (context) => const HistoryPage(),
      },
    );
  }
}
