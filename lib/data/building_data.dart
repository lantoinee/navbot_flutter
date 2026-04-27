import '../models/building_info.dart';

final List<BuildingInfo> buildingData = [
  BuildingInfo(
    name: 'Library',
    standardDirections:
        "The Library is on the All Saints Campus near Oxford Road. "
        "If you are coming through the main campus area, head towards the front of the building.",
    accessibleDirections:
        "The Library is on the All Saints Campus near Oxford Road. "
        "If you are coming from Zaytoni's on Oxford Road, the accessible ramp is on the left-hand side of the building. "
        "This provides a step-free entrance. Once you go through the ID gates, the lifts are on the right.",
    mapsUrl: Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Manchester+Metropolitan+University+Library',
    ),
  ),
  BuildingInfo(
    name: 'Student Union',
    standardDirections:
        "The Students' Union is on the All Saints Campus near the main university buildings. "
        "Walk down Higher Cambridge Street and take a slight left onto Boundary Street West. "
        "The entrance is there.",
    accessibleDirections:
        "The Students' Union is on the All Saints Campus near the main university buildings. "
        "For accessibility support, walk down Higher Cambridge Street and take a slight left onto Boundary Street West. "
        "The accessible entrance is there.",
    mapsUrl: Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Manchester+Metropolitan+University+Students+Union',
    ),
  ),
  BuildingInfo(
    name: 'Brooks',
    standardDirections:
        "The Brooks Building is on the Birley Campus. "
        "When you arrive at the front of the building, use the main entrance.",
    accessibleDirections:
        "The Brooks Building is on the Birley Campus. "
        "The accessible entrance is at the front of the building opposite Birley Campus, next to the rotating doors. "
        "Once inside, the lifts are straight on and then to the right.",
    mapsUrl: Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Manchester+Metropolitan+University+Brooks+Building',
    ),
  ),
  BuildingInfo(
    name: 'John Dalton',
    standardDirections:
        "The new John Dalton Building is on Chester Street. "
        "Locate Nando's on Chester Street, then walk down towards New Medlock House accommodation and look to your left. "
        "You will arrive at the John Dalton Building.",
    accessibleDirections:
        "The new John Dalton Building is on Chester Street. "
        "Locate Nando's on Chester Street, then walk down towards New Medlock House accommodation and look to your left. "
        "You will arrive at the John Dalton Building, where the accessible entrance is straight ahead. "
        "The lifts are straight through the doors.",
    mapsUrl: Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Manchester+Metropolitan+University+John+Dalton+Building',
    ),
  ),
];
