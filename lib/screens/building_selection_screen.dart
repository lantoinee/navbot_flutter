import 'package:flutter/material.dart';
import '../data/building_data.dart';
import '../models/building_info.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'directions_screen.dart';

class BuildingSelectionScreen extends StatelessWidget {
  final bool accessibilityNeeded;

  const BuildingSelectionScreen({
    super.key,
    required this.accessibilityNeeded,
  });

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: NavBotCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.apartment,
                    size: 70,
                    // Matches the primary action colour used across the NAVBOT interface.
                    color: Color(0xFFFF6B00),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choose a Building',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    accessibilityNeeded
                        ? 'Accessibility support is enabled.'
                        : 'Standard navigation is enabled.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._buildBuildingButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBuildingButtons(BuildContext context) {
    final widgets = <Widget>[];

    for (final BuildingInfo building in buildingData) {
      if (widgets.isNotEmpty) {
        widgets.add(const SizedBox(height: 14));
      }

      widgets.add(
        NavBotButton(
          text: building.name,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DirectionsScreen(
                  building: building,
                  accessibilityNeeded: accessibilityNeeded,
                ),
              ),
            );
          },
        ),
      );
    }

    return widgets;
  }
}
