import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorsGenerator {
  Future<Color> generateCardColor(String pokemonImageUrl, bool isDetail) async {
    Color cardColor = Colors.black.withOpacity(0.15);
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
          NetworkImage(pokemonImageUrl));
      if (paletteGenerator.dominantColor != null) {
        if (isDetail) {
          cardColor = paletteGenerator.dominantColor!.color.withOpacity(0.17);
        } else {
          cardColor = paletteGenerator.dominantColor!.color.withOpacity(0.85);
        }
      }
    } catch (error) {
      rethrow;
    }
    return cardColor;
  }
}
