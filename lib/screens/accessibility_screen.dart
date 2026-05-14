// accessibility_screen.dart
// The accessibility preference screen — the first substantive interaction in NAVBOT.
//
// This screen operationalises the anticipatory duty under the Equality Act 2010:
// rather than waiting for a disabled user to encounter a barrier, the application
// proactively asks about accessibility needs before presenting any directions.
//
// The user's choice is passed as the accessibilityNeeded boolean to all subsequent
// screens via the Navigator — set once, respected throughout the entire session.
//
// Evaluation finding: 8/9 participants understood this screen immediately.
// P1 said "Yes, you know I am" and laughed — affirming rather than clinical.
// P2 said it "felt more inclusive even though I myself didn't need it."

import 'package:flutter/material.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'building_selection_screen.dart';

class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003A70),
      appBar: AppBar(
        backgroundColor: const Color(0xFF003A70),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('NAVBOT'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: NavBotCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.accessible, size: 70, color: Color(0xFFFF6B00)),
                const SizedBox(height: 20),
                const Text(
                  'Do you need accessibility support?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF003A70)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Please choose one of the options below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                // Yes — passes accessibilityNeeded: true to all subsequent screens.
                NavBotButton(
                  text: 'Yes',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuildingSelectionScreen(accessibilityNeeded: true),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),
                // No — passes accessibilityNeeded: false to all subsequent screens.
                NavBotButton(
                  text: 'No',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuildingSelectionScreen(accessibilityNeeded: false),
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