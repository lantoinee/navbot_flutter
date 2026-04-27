import 'package:flutter/material.dart';
import '../models/building_info.dart';
import '../services/map_launcher_service.dart';
import '../widgets/navbot_card.dart';
import '../widgets/navbot_button.dart';
import 'library_floor_selection_screen.dart';

class DirectionsScreen extends StatelessWidget {
  final BuildingInfo building;
  final bool accessibilityNeeded;
  final MapLauncherService mapLauncherService;

  const DirectionsScreen({
    super.key,
    required this.building,
    required this.accessibilityNeeded,
    this.mapLauncherService = const MapLauncherService(),
  });

  Future<void> openGoogleMaps(BuildContext context) async {
    final launched = await mapLauncherService.open(building.mapsUrl);

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open Google Maps on this device.'),
        ),
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
                  const Icon(
                    Icons.map,
                    size: 70,
                    color: Color(0xFFF0B323),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    building.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    building.directionsFor(
                      accessibilityNeeded: accessibilityNeeded,
                    ),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  NavBotButton(
                    text: 'Open in Google Maps',
                    onPressed: () => openGoogleMaps(context),
                  ),
                  if (building.name == 'Library') ...[
                    const SizedBox(height: 14),
                    NavBotButton(
                      text: 'View Library Floors',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LibraryFloorSelectionScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 14),
                  NavBotButton(
                    text: 'Choose Another Building',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 14),
                  NavBotButton(
                    text: 'Start Again',
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
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
