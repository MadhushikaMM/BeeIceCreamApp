import 'package:bee_icecream/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bee_icecream/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:bee_icecream/home_screen.dart'; // Import HomeScreen
import 'splash_screen.dart';
import 'login.dart' as login_screen; // Use aliases
import 'signup.dart' as signup_screen; // Use aliases
import 'forgot_password.dart'
    as forgot_password_screen; // Import forgot_password.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const login_screen.Login(),
        '/signup': (context) => signup_screen.Signup(),
        '/home': (context) => const HomeScreen(),
        '/forgot-password': (context) =>
            forgot_password_screen.ForgotPassword(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
