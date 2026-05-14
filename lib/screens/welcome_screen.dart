// welcome_screen.dart
// The first screen the user sees when NAVBOT launches.
//
// Kept deliberately minimal to reduce cognitive load on first launch —
// particularly important for neurodivergent users who benefit from clear,
// unambiguous starting points. A single call to action navigates to the
// AccessibilityScreen, which is the first substantive interaction in the app.

import 'package:flutter/material.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'accessibility_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // MMU institutional blue used as the background across all screens.
      backgroundColor: const Color(0xFF003A70),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: NavBotCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, size: 80, color: Color(0xFFFF6B00)),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to NAVBOT',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF003A70)),
                ),
                const SizedBox(height: 14),
                const Text(
                  'How can I help you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 32),
                // Navigates to AccessibilityScreen — the first mandatory interaction.
                NavBotButton(
                  text: 'Start Navigation',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AccessibilityScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}