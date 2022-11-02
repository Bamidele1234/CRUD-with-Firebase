import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const tag = '/login';

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
