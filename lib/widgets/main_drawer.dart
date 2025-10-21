import 'package:flutter/material.dart';
import 'package:novel_app/pages/profile_page.dart';
import 'package:novel_app/utils/animated_page_route.dart';
import 'package:novel_app/utils/user_session.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = UserSession().getEmail() ?? 'guest@email.com';
    final String username = email.split('@')[0];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text(email),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context); // Tutup drawer
              // Navigasi ke Halaman Profil
              Navigator.push(context, AnimatedPageRoute(page: const ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Reading History'),
            onTap: () {
              // Navigasi ke Halaman History
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              // Navigasi ke Halaman Settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}