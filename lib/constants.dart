import 'package:flutter/material.dart';

// Essential Colors
const kScaffoldColor = Color(0xFF0D1020);
const kListTileColor = Color(0xFF1D1E33);
const kSecondaryColor = Color(0xFFEB1555);
const kTertiaryColor = Color(0xff8A95D0);
const kShadowColor = Color(0xffEE2F69);
const kPopUpColor = Color(0xff12172B);
const kGradientColor = Color(0xFF710928);

// The border for the Signup and Login Screen
const kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(27),
  ),
);

// The Gradient Decoration on each page
const kPageDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kScaffoldColor,
      kGradientColor,
    ],
  ),
);

const kPagePadding = EdgeInsets.symmetric(
  horizontal: 17,
  vertical: 20,
);
