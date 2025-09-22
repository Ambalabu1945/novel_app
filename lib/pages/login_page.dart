import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _fadeController.forward();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const LoginHeader(),
            ),
            const SizedBox(height: 32),
            SlideTransition(
              position: _slideAnimation,
              child: LoginForm(
                emailController: emailController,
                passwordController: passwordController,
              ),
            ),
            const SizedBox(height: 32),
            FadeTransition(
              opacity: _fadeAnimation,
              child: LoginButton(onPressed: handleLogin),
            ),
            const SizedBox(height: 24),
            FadeTransition(
              opacity: _fadeAnimation,
              child: const LoginFooter(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.12,
        ),
        const SizedBox(height: 24),
        const Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Log in to continue your story',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Login'),
      ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
