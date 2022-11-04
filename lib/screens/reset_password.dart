import 'package:flutter/material.dart';

import '../constants.dart';
import '../reusables/back_button.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  static const tag = '/reset';
  final myEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: kPageDecoration,
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
                          child: TextFormField(
                            controller: myEmailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: kSignInStyle,
                          onPressed: () {
                            //context.router.pushNamed(LoginScreen.tag);
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
}
