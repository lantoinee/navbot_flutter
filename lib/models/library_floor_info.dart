// library_floor_info.dart
// Defines the data models for MMU Library floor navigation.
//
// LiftDirectionInfo — directions from one specific lift on a floor.
// LibraryFloorInfo  — all information about one floor of the library.
//
// Lift directions are split into West and East because the routes from each
// lift lead to different room sequences on the same floor. A single set of
// directions would be ambiguous — particularly for users navigating independently.

// LiftDirectionInfo stores what is to the left and right when exiting a specific lift.
class LiftDirectionInfo {
  // What is to the left when walking out of this lift.
  final String leftOfLift;

  // What is to the right when walking out of this lift.
  final String rightOfLift;

  // Additional notes about this lift's position or signage.
  final String notes;

  const LiftDirectionInfo({
    required this.leftOfLift,
    required this.rightOfLift,
    required this.notes,
  });
}

// LibraryFloorInfo stores all navigation-relevant information for one library floor.
class LibraryFloorInfo {
  // Display name shown on screen (e.g. 'Floor 1').
  final String name;

  // Type of study environment (e.g. 'Focused Study').
  final String studyType;

  // List of facilities available on this floor.
  final List<String> facilities;

  // Range of room numbers on this floor.
  final String roomRange;

  // Directions from the West Lift on this floor.
  final LiftDirectionInfo westLift;

  // Directions from the East Lift on this floor.
  final LiftDirectionInfo eastLift;

  // Additional notes not covered by the above fields.
  final String extraNotes;

  const LibraryFloorInfo({
    required this.name,
    required this.studyType,
    required this.facilities,
    required this.roomRange,
    required this.westLift,
    required this.eastLift,
    required this.extraNotes,
  });
}