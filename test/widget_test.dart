import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navbot_flutter/main.dart';
import 'package:navbot_flutter/data/building_data.dart';
import 'package:navbot_flutter/data/library_floor_data.dart';
import 'package:navbot_flutter/screens/directions_screen.dart';
import 'package:navbot_flutter/services/map_launcher_service.dart';

class FakeMapLauncherService extends MapLauncherService {
  const FakeMapLauncherService(this.result);

  final bool result;

  @override
  Future<bool> open(Uri url) async {
    return result;
  }
}

void main() {
  testWidgets('NAVBOT app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const NavBotApp());
    expect(find.text('Welcome to NAVBOT'), findsOneWidget);
  });

  testWidgets('navigation flow reaches accessibility screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NavBotApp());

    await tester.tap(find.text('Start Navigation'));
    await tester.pumpAndSettle();

    expect(find.text('Do you need accessibility support?'), findsOneWidget);
  });

  testWidgets('building selection renders from shared building data', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NavBotApp());

    await tester.tap(find.text('Start Navigation'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();

    for (final building in buildingData) {
      expect(find.text(building.name), findsOneWidget);
    }
  });

  testWidgets('directions screen shows accessible directions', (
    WidgetTester tester,
  ) async {
    final building = buildingData.first;

    await tester.pumpWidget(
      MaterialApp(
        home: DirectionsScreen(
          building: building,
          accessibilityNeeded: true,
        ),
      ),
    );

    expect(find.text(building.name), findsOneWidget);
    expect(
      find.text(building.accessibleDirections),
      findsOneWidget,
    );
  });

  testWidgets('library directions screen shows floor navigation button', (
    WidgetTester tester,
  ) async {
    final library = buildingData.firstWhere((building) => building.name == 'Library');

    await tester.pumpWidget(
      MaterialApp(
        home: DirectionsScreen(
          building: library,
          accessibilityNeeded: false,
        ),
      ),
    );

    expect(find.text('View Library Floors'), findsOneWidget);
  });

  testWidgets('library floor flow shows floor details', (
    WidgetTester tester,
  ) async {
    final library = buildingData.firstWhere((building) => building.name == 'Library');
    final firstFloor = libraryFloorData.first;

    await tester.pumpWidget(
      MaterialApp(
        home: DirectionsScreen(
          building: library,
          accessibilityNeeded: false,
        ),
      ),
    );

    await tester.tap(find.text('View Library Floors'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(firstFloor.name));
    await tester.pumpAndSettle();

    expect(find.text('Study Type'), findsOneWidget);
    expect(find.text(firstFloor.studyType), findsOneWidget);
    expect(find.text('West Lift Directions'), findsOneWidget);
    expect(find.text(firstFloor.westLift.leftOfLift), findsOneWidget);
    expect(find.text('East Lift Directions'), findsOneWidget);
    expect(find.text(firstFloor.eastLift.rightOfLift), findsOneWidget);
  });

  testWidgets('failed map launch shows snackbar instead of crashing', (
    WidgetTester tester,
  ) async {
    final building = buildingData.first;

    await tester.pumpWidget(
      MaterialApp(
        home: DirectionsScreen(
          building: building,
          accessibilityNeeded: false,
          mapLauncherService: const FakeMapLauncherService(false),
        ),
      ),
    );

    await tester.tap(find.text('Open in Google Maps'));
    await tester.pump();

    expect(
      find.text('Could not open Google Maps on this device.'),
      findsOneWidget,
    );
  });
}
