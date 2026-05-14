// building_info.dart
// Defines the BuildingInfo model used throughout the application.
//
// Each building is represented as a BuildingInfo object containing its name,
// two sets of directions (standard and accessible), and a Google Maps URL.
//
// The key design decision is the directionsFor() method — all accessibility
// routing logic lives here rather than being scattered across multiple screens.
// The model decides what to return. Screens simply display it.

class BuildingInfo {
  // The display name of the building shown on screen.
  final String name;

  // Directions for users who do not require accessible routing.
  final String standardDirections;

  // Separately authored directions for users who need step-free access.
  // These are not the same as standard directions with a note added —
  // they describe a genuinely different route where necessary.
  final String accessibleDirections;

  // The Google Maps URL used to launch external navigation.
  final Uri mapsUrl;

  const BuildingInfo({
    required this.name,
    required this.standardDirections,
    required this.accessibleDirections,
    required this.mapsUrl,
  });

  // directionsFor() is the single point of routing logic for the entire application.
  // It takes the user's accessibility preference captured on the AccessibilityScreen
  // and returns the appropriate directions for this building.
  // Using a named parameter makes call sites self-documenting and reduces
  // the risk of passing the boolean the wrong way round.
  String directionsFor({required bool accessibilityNeeded}) {
    return accessibilityNeeded ? accessibleDirections : standardDirections;
  }
}
