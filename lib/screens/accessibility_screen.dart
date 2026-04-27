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
                const Icon(
                  Icons.accessible,
                  size: 70,
                  color: Color(0xFFF0B323),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Do you need accessibility support?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003A70),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Please choose one of the options below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                NavBotButton(
                  text: 'Yes',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuildingSelectionScreen(
                          accessibilityNeeded: true,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),
                NavBotButton(
                  text: 'No',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuildingSelectionScreen(
                          accessibilityNeeded: false,
                        ),
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