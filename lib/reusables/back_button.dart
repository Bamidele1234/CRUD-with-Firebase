import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Custom Back button for popping off stacks
class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          size: 26,
        ),
      ),
    );
  }
}
