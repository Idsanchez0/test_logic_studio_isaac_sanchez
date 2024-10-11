import 'package:url_launcher/url_launcher.dart';

import '../network/network.dart';

class Services {
  Future<void> launchPage({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${Uri.parse(url)}');
    }
  }

  String createUrlImage({required String id}) {
    String pokemonIdPadLeft = (id.toString().padLeft(3, '0'));
    String imagePath = '${network.urlImagePokemon}$pokemonIdPadLeft.png';
    return imagePath;
  }

  String firstLetterUpperCase({required String title}) {
    return title[0].toUpperCase() + title.substring(1);
  }

  String decimetersToMeters(int decimeters) {
    double meters = decimeters / 10;
    return "${meters.toStringAsFixed(2)} M";
  }

  String hectogramsToKilograms(int hectograms) {
    double kilograms = hectograms / 10;
    return "${kilograms.toStringAsFixed(2)} KG";
  }

  double percentReturn(value) {
    double mount = (double.parse(value.toString())) / 100;
    return mount;
  }
}

Services services = Services();
