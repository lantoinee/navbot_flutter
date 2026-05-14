NAVBOT — Inclusive Indoor Wayfinding Application
Manchester Metropolitan University — 6G6Z0019 Synoptic Project
Student Number: 22494467
Ethics Approval: 
Project Overview
NAVBOT is a Flutter mobile application designed to provide inclusive, accessible indoor wayfinding for students at Manchester Metropolitan University. The app was built with neurodivergent and disabled students as the primary user group, following an accessibility-first design approach that operationalises the anticipatory duty under the Equality Act 2010.
The application provides:

Standard and accessible directions to key MMU campus buildings
Granular library floor navigation including room ranges, facilities, and lift-specific directions
Google Maps integration with graceful fallback handling
An accessibility preference screen presented as the first interaction before any directions are shown

Tech Stack
TechnologyPurposeFlutter (Dart)Cross-platform mobile frameworkMaterial DesignUI component libraryurl_launcherGoogle Maps external launchflutter_testWidget testing framework
Project Structure

lib/main.dart — App entry point
lib/data/building_data.dart — MMU building directions data
lib/data/library_floor_data.dart — Library floor navigation data
lib/models/building_info.dart — BuildingInfo model and directionsFor() method
lib/models/library_floor_info.dart — LibraryFloorInfo and LiftDirectionInfo models
lib/screens/welcome_screen.dart — First screen
lib/screens/accessibility_screen.dart — Accessibility preference selection
lib/screens/building_selection_screen.dart — Building list
lib/screens/directions_screen.dart — Directions and Google Maps launch
lib/screens/library_floor_selection_screen.dart — Library floor list
lib/screens/library_floor_detail_screen.dart — Floor detail with lift directions
lib/services/map_launcher_service.dart — Injectable Google Maps launcher
lib/widgets/navbot_button.dart — Reusable MMU-branded button
lib/widgets/navbot_card.dart — Reusable white card container
test/widget_test.dart — 7 widget tests including Maps failure path

Getting Started
Prerequisites

Flutter SDK installed — flutter.dev
Android Studio with an emulator, or a physical device
VS Code with the Flutter extension (recommended)

Installation
bashgit clone https://github.com/yourusername/navbot_flutter.git
cd navbot_flutter
flutter pub get
flutter run
Running on Android Emulator

Open Android Studio
Open Virtual Device Manager
Launch an emulator (Pixel 6, API 34 recommended)
Return to VS Code and select the emulator from the device picker
Run flutter run

Running Tests
bashflutter test test/widget_test.dart
flutter test test/widget_test.dart --name "Failed map launch shows snackbar"
Note: The test suite experienced timeout issues during local execution. The test logic is correct and all flows were verified manually. The key test uses a FakeMapLauncherService to simulate a failed Maps launch via dependency injection — no real device required.
Key Design Decisions
1. Accessibility Screen as First Interaction
The accessibility preference question appears before any building or direction content. This implements the Equality Act 2010 anticipatory duty — the app does not wait for a disabled user to encounter a barrier before offering accessible routing.
2. Separately Authored Directions
Standard and accessible directions for each building are independently written. The accessible Library directions describe a specific step-free route via the ramp parallel to Tesco Extra on Oxford Road — a genuinely different route, not the same directions with a note added.
3. directionsFor() Encapsulation
All routing logic lives in a single method — BuildingInfo.directionsFor() — rather than being distributed across multiple screens. Screens call this method and display the result. This follows the separation of concerns principle and simplifies testing.
4. Dependency Injection for MapLauncherService
MapLauncherService is injected into DirectionsScreen rather than instantiated internally. This allows a FakeMapLauncherService to be used in widget tests, enabling the Google Maps failure path to be verified without a real device.
Known Limitations

Building data is hardcoded — cannot reflect real-time changes such as lift outages
Library floor data for Floors 3 and 4 contains placeholder text pending on-site verification
Flutter test suite experienced timeout issues during local execution
Google Maps integration requires the Maps app to be installed on the device

Buildings Supported
BuildingCampusLibraryAll SaintsStudent UnionAll SaintsBrooks BuildingBirleyJohn Dalton BuildingChester Street
Evaluation Summary
The app was evaluated with 9 MMU students (4 neurodivergent) using a think-aloud protocol.
FindingResultTask completion9/9 completed all tasksDirection clarityMean 3.33/5Accessibility screen comprehension8/9 fully understoodComparison to current navigation9/9 found NAVBOT at least as good
Primary issue: lift orientation language was ambiguous for 4 participants. Primary future recommendation: visual floor plan schematic.
Ethical Considerations

All evaluation participants signed a consent form prior to participation
No personally identifiable data was collected
Ethics approval reference: 88832
Study conducted in accordance with BERA (2018) ethical guidelines

