import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/app_bloc.dart';
import '../../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Provider.of<AppBloc>(
      context,
      listen: false,
    ).checkFirstSeen(context);
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
