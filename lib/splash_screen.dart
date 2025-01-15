import 'dart:async';
import 'package:flutter/material.dart';
import 'my_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 158),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut,
                ),
              ),
              child: Image.asset('lib/images/logo.jpg', height: 150),
            ),
            const SizedBox(height: 50),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.linear,
                ),
              ),
              child: const Text(
                'Bee Ice Cream App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 130, 31, 3),
                ),
              ),
            ),
            const SizedBox(height: 30),
            MyButton(
              text: "Let's Go",
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
          'Powered by RAU',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
