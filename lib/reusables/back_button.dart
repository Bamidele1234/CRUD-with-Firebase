import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Custom Back button for popping off stacks
class MyBackButton extends StatelessWidget {
  const MyBackButton({
    this.myPadding = 10,
    Key? key,
  }) : super(key: key);

  final double myPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(myPadding),
      child: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          size: 30,
        ),
      ),
    );
  }
}
