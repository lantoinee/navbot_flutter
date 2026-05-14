// widget_test.dart
// Widget tests for the NAVBOT Flutter application.
//
// Seven tests cover the primary navigation flows.
// Key feature: FakeMapLauncherService — because MapLauncherService is injected
// as a dependency rather than created internally, tests can substitute a fake
// version returning a fixed result. This allows the Maps failure path (snackbar)
// to be tested without a real device — dependency injection enabling testability.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navbot_flutter/main.dart';
import 'package:navbot_flutter/data/building_data.dart';
import 'package:navbot_flutter/data/library_floor_data.dart';
import 'package:navbot_flutter/screens/directions_screen.dart';
import 'package:navbot_flutter/services/map_launcher_service.dart';

// Replaces the real MapLauncherService in tests.
// Pass false to simulate a failed launch and trigger the snackbar.
class FakeMapLauncherService extends MapLauncherService {
  const FakeMapLauncherService(this.result);
  final bool result;

  @override
  Future<bool> open(Uri url) async => result;
}

void main() {
  // Test 1 — App loads and welcome screen renders.
  testWidgets('NAVBOT app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const NavBotApp());
    expect(find.text('Welcome to NAVBOT'), findsOneWidget);
  });

  // Test 2 — Start Navigation reaches the accessibility screen.
  testWidgets('navigation flow reaches accessibility screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NavBotApp());
    await tester.tap(find.text('Start Navigation'));
    await tester.pumpAndSettle();
    expect(find.text('Do you need accessibility support?'), findsOneWidget);
  });

  // Test 3 — Building selection renders all buildings from shared data.
  testWidgets('building selection renders from shared building data', (WidgetTester tester) async {
    await tester.pumpWidget(const NavBotApp());
    await tester.tap(find.text('Start Navigation'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    for (final building in buildingData) {
      expect(find.text(building.name), findsOneWidget);
    }
  });

  // Test 4 — Directions screen shows accessible directions when accessibilityNeeded is true.
  testWidgets('directions screen shows accessible directions', (WidgetTester tester) async {
    final building = buildingData.first;
    await tester.pumpWidget(MaterialApp(
      home: DirectionsScreen(building: building, accessibilityNeeded: true),
    ));
    expect(find.text(building.name), findsOneWidget);
    expect(find.text(building.accessibleDirections), findsOneWidget);
  });

  // Test 5 — View Library Floors button appears for the Library only.
  testWidgets('library directions screen shows floor navigation button', (WidgetTester tester) async {
    final library = buildingData.firstWhere((b) => b.name == 'Library');
    await tester.pumpWidget(MaterialApp(
      home: DirectionsScreen(building: library, accessibilityNeeded: false),
    ));
    expect(find.text('View Library Floors'), findsOneWidget);
  });

  // Test 6 — Full library floor navigation flow works end to end.
  testWidgets('library floor flow shows floor details', (WidgetTester tester) async {
    final library = buildingData.firstWhere((b) => b.name == 'Library');
    final firstFloor = libraryFloorData.first;
    await tester.pumpWidget(MaterialApp(
      home: DirectionsScreen(building: library, accessibilityNeeded: false),
    ));
    await tester.tap(find.text('View Library Floors'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(firstFloor.name));
    await tester.pumpAndSettle();
    expect(find.text('Study Type'), findsOneWidget);
    expect(find.text(firstFloor.studyType), findsOneWidget);
    expect(find.text('West Lift Directions'), findsOneWidget);
    expect(find.text('East Lift Directions'), findsOneWidget);
  });

  // Test 7 — Failed Maps launch shows snackbar (dependency injection in action).
  // FakeMapLauncherService(false) simulates a failed launch.
  testWidgets('failed map launch shows snackbar instead of crashing', (WidgetTester tester) async {
    final building = buildingData.first;
    await tester.pumpWidget(MaterialApp(
      home: DirectionsScreen(
        building: building,
        accessibilityNeeded: false,
        mapLauncherService: const FakeMapLauncherService(false),
      ),
    ));
    await tester.tap(find.text('Open in Google Maps'));
    await tester.pump();
    expect(find.text('Could not open Google Maps on this device.'), findsOneWidget);
  });
}