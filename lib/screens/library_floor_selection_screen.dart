import 'package:flutter/material.dart';
import '../data/library_floor_data.dart';
import '../models/library_floor_info.dart';
import '../widgets/navbot_button.dart';
import '../widgets/navbot_card.dart';
import 'library_floor_detail_screen.dart';

class LibraryFloorSelectionScreen extends StatelessWidget {
  const LibraryFloorSelectionScreen({super.key});

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
                    Icons.layers,
                    size: 70,
                    color: Color(0xFFF0B323),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Library Floors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Choose a floor to view room and location details.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._buildFloorButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloorButtons(BuildContext context) {
    final widgets = <Widget>[];

    for (final LibraryFloorInfo floor in libraryFloorData) {
      if (widgets.isNotEmpty) {
        widgets.add(const SizedBox(height: 14));
      }

      widgets.add(
        NavBotButton(
          text: floor.name,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LibraryFloorDetailScreen(floor: floor),
              ),
            );
          },
        ),
      );
    }

    return widgets;
  }
}
