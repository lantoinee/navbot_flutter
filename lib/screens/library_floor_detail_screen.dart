import 'package:flutter/material.dart';
import '../models/library_floor_info.dart';
import '../widgets/navbot_button.dart';
import '../widgets/navbot_card.dart';

class LibraryFloorDetailScreen extends StatelessWidget {
  final LibraryFloorInfo floor;

  const LibraryFloorDetailScreen({
    super.key,
    required this.floor,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.meeting_room,
                    size: 70,
                    // Matches the primary action colour used across the NAVBOT interface.
                    color: Color(0xFFFF6B00),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    floor.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Detailed floor information',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _DetailBox(
                    title: 'Study Type',
                    content: floor.studyType,
                  ),
                  const SizedBox(height: 14),
                  _DetailBox(
                    title: 'Facilities',
                    content: floor.facilities.join('\n'),
                  ),
                  const SizedBox(height: 14),
                  _DetailBox(
                    title: 'Room Range',
                    content: floor.roomRange,
                  ),
                  const SizedBox(height: 14),
                  _LiftSection(
                    title: 'West Lift Directions',
                    directions:
                        'Left side:\n${floor.westLift.leftOfLift}\n\nRight side:\n${floor.westLift.rightOfLift}\n\nThe East Lift is also on this side.',
                  ),
                  const SizedBox(height: 14),
                  _LiftSection(
                    title: 'East Lift Directions',
                    directions:
                        'Left side:\n${floor.eastLift.leftOfLift}\n\nThe West Lift is also on this side.\n\nRight side:\n${floor.eastLift.rightOfLift}',
                  ),
                  const SizedBox(height: 24),
                  NavBotButton(
                    text: 'Choose Another Floor',
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

class _LiftSection extends StatelessWidget {
  final String title;
  final String directions;

  const _LiftSection({
    required this.title,
    required this.directions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DetailBox(
          title: title,
          content: directions,
        ),
      ],
    );
  }
}

class _DetailBox extends StatelessWidget {
  final String title;
  final String content;

  const _DetailBox({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD7DEE8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003A70),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
