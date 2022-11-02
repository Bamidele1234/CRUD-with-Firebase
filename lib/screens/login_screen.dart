import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const tag = '/login';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: kPageDecoration,
          child: Padding(
            padding: kPagePadding,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Lets sign you in ',
                    textAlign: TextAlign.start,
                  ),
                  const TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5,
                    ),
                    decoration: kInputDecoration,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5,
                    ),
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Password',
                    ),
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
