import 'package:auto_route/auto_route.dart';
import 'package:exercise6/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance;
    return AlertDialog(
      title: const Text('Soo soon 😢'),
      content: const Text('Are you sure you want to log out ?'),
      actions: [
        TextButton(
          onPressed: () {
            context.router.pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 17,
              //color: k,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            user.signOut();
            int count = 0;
            // Pop up the stack twice
            context.router.popUntil((_) => count++ >= 2);
            Utils.showSnackbar('Successfully logged out');
          },
          child: const Text(
            'Log out',
            style: TextStyle(
              fontSize: 17,
              color: kShadowColor,
            ),
          ),
        )
      ],
      buttonPadding: const EdgeInsets.only(
        right: 15,
      ),
    );
  }
}
