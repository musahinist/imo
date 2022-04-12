import 'dart:math';
import 'package:flutter/material.dart';

class Palette {
  const Palette._();
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color primaryColor = Color(0xFF2BD0D0);
  static const Color primaryColorDark = Color(0xFF1777F2);
  static const Color primaryColorLight = Color(0xFF1777F2);
  static const Color secondaryColorDark = Color(0xFF362958);
  static const Color primaryBackgroundDarkTheme = Color(0xFF1777F2);
  static const Color facebookBlue = Color(0xFF1777F2);
  static const Color dividerColor = Colors.grey;
  static const Color disabledColor = Colors.grey;

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);
  static const MaterialColor appPalette =
      MaterialColor(_appPalettePrimaryValue, <int, Color>{
    50: Color(0xFFE6F9F9),
    100: Color(0xFFBFF1F1),
    200: Color(0xFF95E8E8),
    300: Color(0xFF6BDEDE),
    400: Color(0xFF4BD7D7),
    500: Color(_appPalettePrimaryValue),
    600: Color(0xFF26CBCB),
    700: Color(0xFF20C4C4),
    800: Color(0xFF1ABEBE),
    900: Color(0xFF10B3B3),
  });
  static const int _appPalettePrimaryValue = 0xFF2BD0D0;

  static const MaterialColor appPaletteAccent =
      MaterialColor(_appPaletteAccentValue, <int, Color>{
    100: Color(0xFFE2FFFF),
    200: Color(_appPaletteAccentValue),
    400: Color(0xFF7CFFFF),
    700: Color(0xFF63FFFF),
  });
  static const int _appPaletteAccentValue = 0xFFAFFFFF;

  static const MaterialColor mcgpalette1Accent =
      MaterialColor(_mcgpalette1AccentValue, <int, Color>{
    100: Color(0xFFADFFF3),
    200: Color(_mcgpalette1AccentValue),
    400: Color(0xFF47FFE4),
    700: Color(0xFF2DFFE0),
  });
  static const int _mcgpalette1AccentValue = 0xFF7AFFEC;

  static const LinearGradient storyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black26]);
  static Color get randomColor {
    final Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    // return Color(random.nextInt(0xFFFFFFFF));
  }

  static Color get randomDarkColor {
    final Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(155), random.nextInt(155), random.nextInt(155));
    // return Color(random.nextInt(0xFFFFFFFF)& 0x7F7F7F);
  }

  static Color get randomLightColor {
    final Random random = Random();
    return Color.fromARGB(255, 155 + random.nextInt(100),
        155 + random.nextInt(100), 155 + random.nextInt(100));
  }

  static Color get randomMaterialColor {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color get randomSemiTransColor {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.5);
  }

  static Color toGrayScale(Color color) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    int alpha = color.alpha;
    int gray = (299 * red + 587 * green + 114 * blue) ~/ 1000;
    return Color.fromARGB(alpha, gray, gray, gray);
  }

  ///specified by the W3C.
  static bool isDark(Color color, [double darknessThreshold = 0.179]) {
    final luminance = color.computeLuminance();
    return luminance < darknessThreshold;
  }

  static bool isDarkFromGrayScale(Color color,
      [double darknessThreshold = 186]) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    // int alpha = color.alpha;
    int gray = (299 * red + 587 * green + 114 * blue) ~/ 1000;
    return gray > darknessThreshold;
  }
}
