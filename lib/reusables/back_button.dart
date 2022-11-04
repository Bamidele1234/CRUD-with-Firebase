import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Custom Back button for popping off stacks
class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
