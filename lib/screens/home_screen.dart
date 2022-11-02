import 'package:auto_route/auto_route.dart';
import 'package:exercise6/constants.dart';
import 'package:exercise6/screens/login_screen.dart';
import 'package:exercise6/screens/sign_up.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const tag = '/home';

  @override
  Widget build(BuildContext context) {
    // LOGIN button style
    final ButtonStyle style1 = ElevatedButton.styleFrom(
      primary: kScaffoldColor,
      textStyle: const TextStyle(
        fontSize: 18,
        letterSpacing: 1.2,
      ),
      elevation: 12,
      minimumSize: const Size(100, 50),
      shape: kButtonShape,
    );

    // SIGNUP button style
    final ButtonStyle style2 = OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 18,
        letterSpacing: 1.2,
      ),
      side: const BorderSide(color: kScaffoldColor, width: 1.7),
      minimumSize: const Size(100, 50),
      shape: kButtonShape,
    );

    return Scaffold(
      body: Container(
        decoration: kPageDecoration,
        child: Padding(
          padding: kPagePadding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.done_rounded,
                  size: 135,
                  color: kShadowColor,
                ),
                const Text(
                  "All your tasks in one place",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Asap',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 135,
                ),
                ElevatedButton(
                  style: style1,
                  onPressed: () {
                    context.router.pushNamed(LoginScreen.tag);
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.router.pushNamed(SignUpScreen.tag);
                  },
                  style: style2,
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
