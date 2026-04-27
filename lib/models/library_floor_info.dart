class LiftDirectionInfo {
  final String leftOfLift;
  final String rightOfLift;
  final String notes;

  const LiftDirectionInfo({
    required this.leftOfLift,
    required this.rightOfLift,
    required this.notes,
  });
}

class LibraryFloorInfo {
  final String name;
  final String studyType;
  final List<String> facilities;
  final String roomRange;
  final LiftDirectionInfo westLift;
  final LiftDirectionInfo eastLift;
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
