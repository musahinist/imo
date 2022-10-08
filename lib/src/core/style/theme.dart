import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'palette.dart';
import 'typography.dart';

class AppTheme {
  const AppTheme._();

  static const appBarTheme = AppBarTheme(
    elevation: 0.0,
  );
  static final TextStyle baseTextStyle = GoogleFonts.publicSans();

  // static const textTheme = TextTheme(
  //   headline1: TextStyle(
  //     fontSize: 30,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //   ),
  // );
  static const textTheme = TextTheme(
    headline1: TextStyle(
      //   fontFamily: fontName,
      fontSize: 96,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      //   fontFamily: fontName,
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
    headline3: MyTypography.xHugeBoldText,
    headline4: MyTypography.hugeSemiBoldText,
    headline5: MyTypography.xXlargeSemiBoldText,
    headline6: MyTypography.xlargeSemiBoldText,
    subtitle1: MyTypography.largeSemiBoldText,
    subtitle2: MyTypography.largeRegularText,
    bodyText1: MyTypography.mediumRegularText,
    bodyText2: MyTypography.smallRegularText,
    button: MyTypography.mediumMediumText,
    caption: MyTypography.smallRegularText,
    overline: MyTypography.xSmallRegularText,
  );

  static final inputDecorationTheme = InputDecorationTheme(
    // fillColor: Colors.white,
    // filled: true,
    floatingLabelStyle: const TextStyle(
      color: Palette.primaryColor,
    ),
    alignLabelWithHint: true,
    border: const OutlineInputBorder(),

    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    // enabledBorder: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Palette.primaryColor, width: 1),
    ),
    //
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 48),

      backgroundColor: Palette.primaryColor,
      padding: const EdgeInsets.all(12),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Palette.primaryColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(color: Palette.primaryColor),
      textStyle:
          MyTypography.mediumMediumText.copyWith(color: Palette.primaryColor),
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: baseTextStyle.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primarySwatch: Palette.appPalette,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,
    // colorScheme: const ColorScheme.light(
    //     primary: Colors.black, brightness: Brightness.light),
    disabledColor: Colors.grey,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    //  accentColor: Palette.primaryColor,
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appBarTheme,
    // primaryTextTheme: primaryTextTheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: baseTextStyle.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,

    // colorScheme: const ColorScheme.light(
    //     primary: Colors.white, brightness: Brightness.light),
    disabledColor: Palette.disabledColor,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    // accentColor: Palette.primaryColor,
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appBarTheme.copyWith(
        color: Colors.grey[900], systemOverlayStyle: SystemUiOverlayStyle.dark),
    textTheme: textTheme,
    inputDecorationTheme:
        inputDecorationTheme.copyWith(fillColor: Colors.grey[50]),
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[850],
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );
}
