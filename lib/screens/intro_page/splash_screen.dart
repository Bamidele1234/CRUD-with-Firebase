import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/auth_page/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    if (!seen) {
      await prefs.setBool('seen', true);
    }

    return Timer(
      const Duration(milliseconds: 2000),
      () {
        if (seen) {
          context.router.replaceNamed(AuthScreen.tag);
        } else {
          context.router.replaceNamed(HomeScreen.tag);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kPageDecoration,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    'DONE',
                    textStyle: const TextStyle(
                      fontFamily: 'Asap',
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2.5,
                      color: kShadowColor,
                      fontSize: 95,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 320),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
