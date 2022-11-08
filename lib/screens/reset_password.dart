import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../reusables/back_button.dart';
import '../utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const tag = '/reset';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final myEmailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    myEmailController.dispose();
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
                          'Reset Password',
                          textAlign: TextAlign.start,
                          style: kMainTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 25,
                          ),
                          child: Text(
                            'Enter the email associated with your '
                            'account and we\'ll send an email with '
                            'instructions to reset your password',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 86),
                          child: Form(
                            key: formKey,
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
                        ),
                        ElevatedButton(
                          style: kSignInStyle,
                          onPressed: () {
                            // Remove the keyboard
                            FocusScope.of(context).unfocus();
                            verifyEmail();
                          },
                          child: const Text("Send Instructions"),
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

  Future verifyEmail() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await auth.sendPasswordResetEmail(
        email: myEmailController.text.trim(),
      );
      Utils.showSnackbar('Password reset email sent');

      // keeps popping routes until predicate is satisfied
      //context.router.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      log(e.toString());

      Utils.showSnackbar(e.message);
    }
    context.router.pop();
  }
}
