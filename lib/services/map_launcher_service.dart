import 'package:url_launcher/url_launcher.dart';

class MapLauncherService {
  const MapLauncherService();

  Future<bool> open(Uri url) {
    return launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
