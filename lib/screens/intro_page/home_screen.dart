import 'package:auto_route/auto_route.dart';
import 'package:exercise6/constants.dart';
import 'package:exercise6/screens/auth_page/login_screen.dart';
import 'package:exercise6/screens/auth_page/sign_up.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const tag = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: kPageDecoration,
        child: SafeArea(
          child: Padding(
            padding: kPagePadding,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.done_rounded,
                    size: 140,
                    color: kShadowColor,
                  ),
                  const Text(
                    "All your tasks in one place",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 135,
                  ),
                  ElevatedButton(
                    style: kSignInStyle,
                    onPressed: () {
                      context.router.pushNamed(LoginScreen.tag);
                    },
                    child: const Text("Sign in"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      context.router.pushNamed(SignUpScreen.tag);
                    },
                    style: kRegisterStyle,
                    child: const Text("Register"),
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
