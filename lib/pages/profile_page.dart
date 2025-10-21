import 'package:flutter/material.dart';
import 'package:novel_app/pages/history_page.dart'; // <-- Import history
import 'package:novel_app/pages/login_page.dart';
import 'package:novel_app/utils/animated_page_route.dart'; // <-- Import animasi
import 'package:novel_app/utils/user_session.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _handleLogout(BuildContext context) {
    UserSession().logout();
    Navigator.of(context).pushAndRemoveUntil(
      AnimatedPageRoute(page: const LoginPage()), // <-- Pakai animasi
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ambil email dari UserSession (bukan username)
    final String email = UserSession().getEmail() ?? 'guest@email.com'; // <-- Diubah

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(
              email.split('@')[0], // Tampilkan nama sebelum '@'
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              email, // Tampilkan email lengkap
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey
              ),
            ),
            const Divider(height: 48),

            // --- INI DIPERBAIKI ---
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Reading History'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Sekarang bisa diklik
                Navigator.push(
                  context,
                  AnimatedPageRoute(page: const HistoryPage()), // <-- Pakai animasi
                );
              },
            ),
            // --- BATAS PERBAIKAN ---

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _handleLogout(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}