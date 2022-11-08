import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:exercise6/constants.dart';
import 'package:exercise6/screens/body_page/task_screen.dart';
import 'package:exercise6/screens/auth_page/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../reusables/back_button.dart';
import '../../utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const tag = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final myFullNameController = TextEditingController();
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
                          'Create a new account',
                          textAlign: TextAlign.start,
                          style: kMainTextStyle,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: TextFormField(
                                  maxLength: 40,
                                  controller: myFullNameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a name';
                                    } else if (value.startsWith(' ')) {
                                      return 'Cannot start with a space';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Username',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: TextFormField(
                                  controller: myEmailController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  validator: (email) => email != null &&
                                          !EmailValidator.validate(email)
                                      ? 'Enter a valid email'
                                      : null,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: TextFormField(
                                  controller: myPasswordController,
                                  textInputAction: TextInputAction.done,
                                  obscureText:
                                      _passwordVisible, //This will obscure text dynamically
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      value != null && value.length < 6
                                          ? 'Enter a minimum of 6 characters'
                                          : null,
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
                        const SizedBox(
                          height: 45,
                        ),
                        ElevatedButton(
                          style: kSignInStyle,
                          onPressed: () {
                            signUp();
                          },
                          child: const Text("Register Now"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account ?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.65),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Sign In',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router
                                          .replaceNamed(LoginScreen.tag);
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await auth.createUserWithEmailAndPassword(
        email: myEmailController.text.trim(),
        password: myPasswordController.text.trim(),
      );
      context.router.pushNamed(TaskScreen.tag);
    } on FirebaseAuthException catch (e) {
      log(e.toString());

      Utils.showSnackbar(e.message);
    }
    // keeps popping routes until predicate is satisfied
    context.router.popUntil((route) => route.isFirst);
  }
}
