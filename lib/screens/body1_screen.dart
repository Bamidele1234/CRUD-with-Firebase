import 'package:exercise6/constants.dart';
import 'package:exercise6/reusables/back_button.dart';
import 'package:exercise6/list/task_list.dart';
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
          decoration: kPageDecoration,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const MyBackButton(),
                Padding(
                  padding: kPagePadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        'Tasks',
                        style: TextStyle(
                          fontFamily: 'Asap',
                          fontWeight: FontWeight.w600,
                          fontSize: 45,
                          letterSpacing: 1.5,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '12 pending ',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 8,
                        ),
                        child: Flexible(
                          child: TaskList(),
                        ),
                      ),
                    ],
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
