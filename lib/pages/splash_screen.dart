import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller.forward();
    });

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (_, __, ___) => const SplashTransition(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const SplashBackground(),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SplashAnimator(size: size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashAnimator extends StatelessWidget {
  final Size size;
  const SplashAnimator({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SplashLogo(),
        SizedBox(height: 24),
        SplashText(),
        SizedBox(height: 12),
        SplashTagline(),
      ],
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/logo.png',
        height: size.height * 0.16,
      ),
    );
  }
}

class SplashText extends StatelessWidget {
  const SplashText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'MYNOVEL_APP',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurpleAccent,
        letterSpacing: 2,
      ),
    );
  }
}

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your story begins here...',
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.deepPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class SplashTransition extends StatelessWidget {
  const SplashTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Let’s begin your journey...',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
