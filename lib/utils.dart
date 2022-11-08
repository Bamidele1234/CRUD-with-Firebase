import 'package:flutter/material.dart';

import 'constants.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white, letterSpacing: 1),
      ),
      backgroundColor: kScaffoldColor.withOpacity(0.7),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
