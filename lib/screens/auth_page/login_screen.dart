import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/body_page/task_screen.dart';
import 'package:exercise6/screens/reset_password.dart';
import 'package:exercise6/screens/auth_page/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../reusables/back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const tag = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Define the controllers
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

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
                                  obscureText:
                                      _passwordVisible, //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toggle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
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
                          onPressed: () async {
                            signIn();
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
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await auth.signInWithEmailAndPassword(
        email: myEmailController.text.trim(),
        password: myPasswordController.text.trim(),
      );
      context.router.pushNamed(TaskScreen.tag);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    // keeps popping routes until predicate is satisfied
    context.router.popUntil((route) => route.isFirst);
  }
}
