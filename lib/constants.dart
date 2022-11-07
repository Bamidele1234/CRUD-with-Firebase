import 'package:exercise6/screens/auth_page/login_screen.dart';
import 'package:exercise6/screens/auth_page/sign_up.dart';
import 'package:flutter/material.dart';

// Essential Colors
const kScaffoldColor = Color(0xFF0D1020);
const kShadowColor = Color(0xffEE2F69);
const kGradientColor = Color(0xFF710928);
const kSheetColor = Color(0xFF170F20);
const kListTileColor = Color(0xFF1D1E33);

double kbuttonTextSize = 15;

/// The border for the [SignUpScreen] and [LoginScreen]
const kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(25),
  ),
);

/// The Gradient Decoration on each page
const kPageDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      kScaffoldColor,
      kGradientColor,
    ],
  ),
);

/// The padding around each page
const kPagePadding = EdgeInsets.symmetric(
  horizontal: 18,
  vertical: 20,
);

/// The style of the main texts on the [SignUpScreen] and [LoginScreen]
final kMainTextStyle = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.w500,
  color: Colors.white.withOpacity(0.95),
  letterSpacing: 0.8,
);

/// The SIGN IN button style
final kSignInStyle = ElevatedButton.styleFrom(
  primary: kScaffoldColor,
  textStyle: TextStyle(
    fontSize: kbuttonTextSize,
    letterSpacing: 1,
  ),
  elevation: 12,
  minimumSize: const Size(100, 52),
  shape: kButtonShape,
);

/// The Register button style
final kRegisterStyle = ElevatedButton.styleFrom(
  textStyle: TextStyle(
    fontSize: kbuttonTextSize,
    letterSpacing: 1,
  ),
  side: const BorderSide(color: kScaffoldColor, width: 1.7),
  minimumSize: const Size(100, 52),
  shape: kButtonShape,
);

/// The border for the input fields
const kmyBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kShadowColor),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

// The shape of the bottomModalSheet
const kRoundedBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);
