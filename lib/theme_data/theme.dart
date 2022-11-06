import 'package:flutter/material.dart';
import '../constants.dart';

/// Vital theme data
class MyTheme {
  ThemeData themeData = ThemeData.dark().copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kScaffoldColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      errorStyle: const TextStyle(
        color: kShadowColor,
      ),
      errorBorder: kmyBorder,
      enabledBorder: kmyBorder.copyWith(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      focusedBorder: kmyBorder.copyWith(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.2,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: kSheetColor,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // horizontalTitleGap: 7, <= If I eventually decide to add a rounded check box
      style: ListTileStyle.list,
      tileColor: kListTileColor,
    ),
  );
}
