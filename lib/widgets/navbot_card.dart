// navbot_card.dart
// Reusable white rounded container used on every screen in NAVBOT.
//
// All content cards use this component for consistent padding, border radius,
// and shadow across the app. The maxWidth of 350px prevents text from spanning
// the full screen width on larger devices — important for readability,
// particularly for users with dyslexia or reading difficulties.

import 'package:flutter/material.dart';

class NavBotCard extends StatelessWidget {
  final Widget child;

  const NavBotCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // Limits card width to 350px for comfortable reading on larger screens.
      constraints: const BoxConstraints(maxWidth: 350),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black12, width: 1),
          // Drop shadow lifts the card visually above the blue background.
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}