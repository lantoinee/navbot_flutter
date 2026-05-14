import 'package:url_launcher/url_launcher.dart';

class MapLauncherService {
  const MapLauncherService();

  Future<bool> open(Uri url) {
    // Wrapped in a service so widget tests can inject a fake launcher instead of opening a real maps app.
    return launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
