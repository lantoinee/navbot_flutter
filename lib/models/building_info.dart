class BuildingInfo {
  final String name;
  final String standardDirections;
  final String accessibleDirections;
  final Uri mapsUrl;

  const BuildingInfo({
    required this.name,
    required this.standardDirections,
    required this.accessibleDirections,
    required this.mapsUrl,
  });

  String directionsFor({required bool accessibilityNeeded}) {
    // A single lookup method keeps the UI simple while switching between standard and step-free route guidance.
    return accessibilityNeeded ? accessibleDirections : standardDirections;
  }
}
