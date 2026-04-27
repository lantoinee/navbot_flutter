import '../models/library_floor_info.dart';

final List<LibraryFloorInfo> libraryFloorData = [
  const LibraryFloorInfo(
    name: 'Floor 1',
    studyType: 'Focused Study',
    facilities: [
      'Computers',
      'Laptop Loans',
      'Special Collections Supported Learning',
      'Exhibition Catalogues',
      'Kitchen',
      'Toilets',
    ],
    roomRange: 'Rooms 1.10 to 1.59',
    westLift: LiftDirectionInfo(
      leftOfLift: 'Rooms 1.40 to 1.41, plus the stairs and lift.',
      rightOfLift:
          'Rooms 1.10 to 1.39 and 1.42 to 1.59, plus SC Supported Learning, Exhibition Catalogues, and toilets.',
      notes:
          'This is based on the West Lift sign. Left and right are relative to walking out of the West Lift.',
    ),
    eastLift: LiftDirectionInfo(
      leftOfLift:
          'Rooms 1.10 to 1.18 and 1.49 to 1.59. You can also find computers, laptop loans, SC Supported Learning, and toilets on the left side.',
      rightOfLift:
          'Rooms 1.19 to 1.48 are on the right side, along with computers, exhibition catalogues, kitchen, and toilets.',
      notes:
          'This is based on the East Lift side signage collected earlier. Left and right are relative to walking out of the East Lift.',
    ),
    extraNotes:
        'Floor 1 now separates directions by lift because the routes change depending on which lift you use.',
  ),
  const LibraryFloorInfo(
    name: 'Floor 2',
    studyType: 'Collaborative Study',
    facilities: [
      'Computers',
      'Special Collections Reading Room',
      'Wellbeing Room',
      'Prayer Room',
      'Kitchen',
      'Toilets',
    ],
    roomRange: 'Rooms 2.01 to 2.49',
    westLift: LiftDirectionInfo(
      leftOfLift:
          'Rooms 2.35 to 2.38 are to the left, alongside the stairs and lift.',
      rightOfLift:
          'Rooms 2.01 to 2.34 and 2.39 to 2.49 are to the right. This side also has computers, the Special Collections Reading Room, the Wellbeing Room, Prayer, the kitchen, and toilets.',
      notes:
          'This is based on the West Lift sign. Left and right are relative to walking out of the West Lift.',
    ),
    eastLift: LiftDirectionInfo(
      leftOfLift:
          'The male toilets are on the left side when you come out of the East Lift. The room-number directions are different from the West Lift and still need to be fully confirmed.',
      rightOfLift:
          'The kitchen and the female toilets are on the right side when you come out of the East Lift. The room-number directions are different from the West Lift and still need to be fully confirmed.',
      notes:
          'This is based on your confirmed East Lift notes so far. The exact East Lift room ranges still need to be added once the signage is checked.',
    ),
    extraNotes:
        'Floor 2 now separates directions by lift because the routes differ depending on whether you use the West Lift or East Lift.',
  ),
  const LibraryFloorInfo(
    name: 'Floor 3',
    studyType: 'Collaborative Study',
    facilities: [
      'Computers',
      'Toilets',
    ],
    roomRange: 'Rooms on Floor 3',
    westLift: LiftDirectionInfo(
      leftOfLift:
          'Detailed West Lift left-side room information has not been added yet.',
      rightOfLift:
          'Detailed West Lift right-side room information has not been added yet.',
      notes: 'Add Floor 3 West Lift signage here when available.',
    ),
    eastLift: LiftDirectionInfo(
      leftOfLift:
          'Detailed East Lift left-side room information has not been added yet.',
      rightOfLift:
          'Detailed East Lift right-side room information has not been added yet.',
      notes: 'Add Floor 3 East Lift signage here when available.',
    ),
    extraNotes:
        'This floor is mainly set up for collaborative working rather than specialist rooms. Add sign details here when available.',
  ),
  const LibraryFloorInfo(
    name: 'Floor 4',
    studyType: 'Focused Study',
    facilities: [
      'Computers',
      'Supported Learning',
      'Kitchen',
      'Toilets',
    ],
    roomRange: 'Rooms on Floor 4',
    westLift: LiftDirectionInfo(
      leftOfLift:
          'Detailed West Lift left-side room information has not been added yet.',
      rightOfLift:
          'Detailed West Lift right-side room information has not been added yet.',
      notes: 'Add Floor 4 West Lift signage here when available.',
    ),
    eastLift: LiftDirectionInfo(
      leftOfLift:
          'Detailed East Lift left-side room information has not been added yet.',
      rightOfLift:
          'Detailed East Lift right-side room information has not been added yet.',
      notes: 'Add Floor 4 East Lift signage here when available.',
    ),
    extraNotes:
        'This is a quieter upper floor intended for more focused study. Add sign details here when available.',
  ),
];
