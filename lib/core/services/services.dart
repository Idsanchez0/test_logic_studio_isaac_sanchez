import 'package:url_launcher/url_launcher.dart';

class Services {
  Future<void> launchPage({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${Uri.parse(url)}');
    }
  }
}

Services services = Services();
