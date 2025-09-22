import 'package:flutter/material.dart';
import '../utils/dummy_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = dummyUser;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              user.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),

            // Role
            Text(
              user.role,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),

            // Email
            Row(
              children: [
                const Icon(Icons.email, color: Colors.grey, size: 18),
                const SizedBox(width: 8),
                Text(
                  user.email,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Bio
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                user.bio,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Status
            Text(
              user.isLoggedIn ? '🟢 Logged In' : '🔴 Logged Out',
              style: TextStyle(
                color: user.isLoggedIn ? Colors.greenAccent : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
