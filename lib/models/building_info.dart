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
    return accessibilityNeeded ? accessibleDirections : standardDirections;
  }
}
