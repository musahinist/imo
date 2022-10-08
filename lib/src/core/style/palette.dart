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
}
