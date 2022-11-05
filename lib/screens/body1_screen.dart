import 'package:exercise6/constants.dart';
import 'package:exercise6/reusables/back_button.dart';
import 'package:flutter/material.dart';

import '../reusables/edit_task_sheet.dart';

class Body1Screen extends StatelessWidget {
  const Body1Screen({Key? key}) : super(key: key);

  static const tag = '/body';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 5),
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: kRoundedBorder,
                context: context,
                builder: (context) => const EditTaskSheet(
                  function: '/add',
                ),
              );
            },
            tooltip: 'Add a task',
            child: const Icon(
              Icons.add,
              size: 33,
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
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
                      children: const [],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
