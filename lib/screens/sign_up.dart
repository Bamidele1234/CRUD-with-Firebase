import 'package:exercise6/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const tag = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kPageDecoration,
        child: const Padding(
          padding: kPagePadding,
          child: Center(
            child: Text('AAAAAAAAAAAAAAAAAAA'),
          ),
        ),
      ),
    );
  }
}
