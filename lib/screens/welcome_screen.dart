import 'package:flutter/material.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'accessibility_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003A70),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: NavBotCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 80,
                  color: Color(0xFFF0B323),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to NAVBOT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003A70),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'How can I help you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 32),
                NavBotButton(
                  text: 'Start Navigation',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccessibilityScreen(),
                      ),
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