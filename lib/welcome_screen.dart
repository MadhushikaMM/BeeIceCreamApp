import 'package:flutter/material.dart';
import 'my_button.dart'; // Import your custom button file

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 158),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Bee Ice Cream App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 89, 6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              MyButton(
                text: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, '/login'); // Navigate to Login
                },
              ),
              const SizedBox(height: 20),
              MyButton(
                text: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, '/signup'); // Navigate to Signup
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
