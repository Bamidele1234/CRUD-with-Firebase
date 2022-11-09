import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/intro_page/home_screen.dart';
import 'package:flutter/material.dart';

/// Custom Back button for popping off stacks
class MyBackButton extends StatelessWidget {
  const MyBackButton({
    this.myPadding = 10,
    this.toHomeScreen = false,
    Key? key,
  }) : super(key: key);

  final double myPadding;
  final bool toHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(myPadding),
      child: IconButton(
        onPressed: () {
          if (toHomeScreen) {
            context.router.replaceNamed(HomeScreen.tag);
          } else {
            context.router.pop();
          }
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          size: 30,
        ),
      ),
    );
  }
}
