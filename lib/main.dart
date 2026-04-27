import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const NavBotApp());
}

class NavBotApp extends StatelessWidget {
  const NavBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAVBOT',
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}