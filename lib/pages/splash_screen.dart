import 'dart:async';
import 'package:flutter/material.dart';
import 'package:novel_app/pages/home_page.dart'; 
import 'package:novel_app/pages/login_page.dart'; 
import 'package:novel_app/utils/user_session.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  void _checkSessionAndNavigate() {
    Timer(const Duration(seconds: 3), () {
      // Menggunakan service UserSession (OOP)
      bool loggedIn = UserSession().isLoggedIn();

      if (mounted) { // Pastikan widget masih ada di tree
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // Jika sudah login, ke HomePage. Jika belum, ke LoginPage.
            builder: (context) => loggedIn ? const HomePage() : const LoginPage(),
            // Anda harus membuat LoginPage() sendiri
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Menggunakan logo Anda
              width: 150,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            const Text('Loading your library...'),
          ],
        ),
      ),
    );
  }
}