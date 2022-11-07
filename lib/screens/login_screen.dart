import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/reset_password.dart';
import 'package:exercise6/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../reusables/back_button.dart';
import 'body1_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const tag = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  @override
  void dispose() {
    myEmailController.dispose();
    myPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: kPageDecoration,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyBackButton(),
                Padding(
                  padding: kPagePadding,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Let\'s sign you in',
                          textAlign: TextAlign.start,
                          style: kMainTextStyle,
                        ),
                        Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: TextFormField(
                                  maxLength: 40,
                                  controller: myEmailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 10,
                                ),
                                child: TextFormField(
                                  controller: myPasswordController,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router.pushNamed(ResetPassword.tag);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: Text(
                              'Forgot Password',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        ElevatedButton(
                          style: kSignInStyle,
                          onPressed: () {
                            context.router.pushNamed(Body1Screen.tag);
                          },
                          child: const Text("Sign In"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account ?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.65),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Register',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router
                                          .replaceNamed(SignUpScreen.tag);
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: myEmailController.text.trim(),
        password: myPasswordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    // keeps popping routes until predicate is satisfied
    context.router.popUntil((route) => route.isFirst);
  }
}
