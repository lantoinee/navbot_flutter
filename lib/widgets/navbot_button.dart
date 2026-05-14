// navbot_button.dart
// Reusable button widget used on every screen in NAVBOT.
//
// All interactive buttons use this component to ensure visual consistency.
// Styled in MMU orange (#FF6B00) with black text for high contrast.
// Minimum height of 58px exceeds the 48px Material Design accessibility minimum,
// ensuring touch targets are large enough for users with motor impairments.

import 'package:flutter/material.dart';

class NavBotButton extends StatelessWidget {
  // The label displayed inside the button.
  final String text;

  // The callback triggered when the button is tapped.
  final VoidCallback onPressed;

  const NavBotButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Full width button for easy tapping on mobile.
      width: double.infinity,
      // 58px exceeds the Material Design 48px accessibility minimum.
      height: 58,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // MMU institutional orange.
          backgroundColor: const Color(0xFFFF6B00),
          foregroundColor: Colors.black,
          elevation: 4,
          shadowColor: Colors.black26,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}