// main.dart
// Entry point for the NAVBOT Flutter application.
// This file initialises the app and launches the WelcomeScreen as the first screen.

import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

// main() is the first function Flutter calls when the app starts.
void main() {
  runApp(const NavBotApp());
}

// NavBotApp is the root widget of the application.
// It sets up the MaterialApp with the app title and starting screen.
// StatelessWidget is used here because the root configuration never changes.
class NavBotApp extends StatelessWidget {
  const NavBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAVBOT',
      // Hides the debug banner in the top-right corner during development.
      debugShowCheckedModeBanner: false,
      // WelcomeScreen is the first screen the user sees when the app launches.
      home: const WelcomeScreen(),
    );
  }
}