import 'package:flutter/material.dart';
import '../constants.dart';

/// Vital theme data
class MyTheme {
  ThemeData themeData = ThemeData.dark().copyWith(
    // canvasColor: Colors.transparent, => I could also use this
    popupMenuTheme: const PopupMenuThemeData(
      color: kPopUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(0),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: kListTileColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(
        color: kShadowColor,
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kShadowColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kTertiaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kTertiaryColor),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: kScaffoldColor,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      horizontalTitleGap: 7,
      style: ListTileStyle.drawer,
      tileColor: kListTileColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: kTertiaryColor,
      contentTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 17.5,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
