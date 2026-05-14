// directions_screen.dart
// Displays directions to the selected building based on the accessibility preference.
//
// Two key design decisions:
//
// 1. Routing via BuildingInfo.directionsFor()
//    The screen contains no if-else routing logic. It delegates the decision
//    to the BuildingInfo model, which returns the correct directions.
//
// 2. Dependency injection for MapLauncherService
//    The screen accepts a MapLauncherService from outside rather than creating
//    one internally. In tests a FakeMapLauncherService is injected to simulate
//    a failed Maps launch without needing a real device.

import 'package:flutter/material.dart';
import '../models/building_info.dart';
import '../services/map_launcher_service.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'library_floor_selection_screen.dart';

class DirectionsScreen extends StatelessWidget {
  final BuildingInfo building;
  final bool accessibilityNeeded;

  // Defaults to the real service in production.
  // A FakeMapLauncherService can be injected during widget testing.
  final MapLauncherService mapLauncherService;

  const DirectionsScreen({
    super.key,
    required this.building,
    required this.accessibilityNeeded,
    this.mapLauncherService = const MapLauncherService(),
  });

  // Attempts to open Google Maps. Shows a snackbar if the launch fails
  // rather than crashing or silently doing nothing.
  // context.mounted is checked after the async gap to avoid calling
  // ScaffoldMessenger on an unmounted widget.
  Future<void> openGoogleMaps(BuildContext context) async {
    final launched = await mapLauncherService.open(building.mapsUrl);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps on this device.')),
      );
    }
  }

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.map, size: 70, color: Color(0xFFFF6B00)),
                  const SizedBox(height: 20),
                  Text(
                    building.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF003A70)),
                  ),
                  const SizedBox(height: 20),
                  // directionsFor() returns standard or accessible directions.
                  // All routing logic lives in the BuildingInfo model — not here.
                  Text(
                    building.directionsFor(accessibilityNeeded: accessibilityNeeded),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  NavBotButton(
                    text: 'Open in Google Maps',
                    onPressed: () => openGoogleMaps(context),
                  ),
                  // View Library Floors only shown for the Library building.
                  if (building.name == 'Library') ...[
                    const SizedBox(height: 14),
                    NavBotButton(
                      text: 'View Library Floors',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LibraryFloorSelectionScreen()),
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 14),
                  NavBotButton(
                    text: 'Choose Another Building',
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 14),
                  // popUntil removes all intermediate screens cleanly.
                  NavBotButton(
                    text: 'Start Again',
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}