// map_launcher_service.dart
// Wraps the url_launcher package for opening Google Maps.
//
// Rather than calling launchUrl() directly in DirectionsScreen, the logic
// is wrapped here. This applies the dependency injection pattern: the screen
// accepts a MapLauncherService from outside rather than creating one internally.
//
// The benefit is testability — in widget tests a FakeMapLauncherService
// can be injected to simulate a failed launch without needing a real device.
// See test/widget_test.dart for the FakeMapLauncherService implementation.

import 'package:url_launcher/url_launcher.dart';

class MapLauncherService {
  const MapLauncherService();

  // Opens the given URL in Google Maps as an external application.
  // Returns true if successful, false if the launch failed.
  Future<bool> open(Uri url) {
    return launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
