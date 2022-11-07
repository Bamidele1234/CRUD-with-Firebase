import 'package:auto_route/auto_route.dart';
import 'package:exercise6/constants.dart';
import 'package:exercise6/list/task_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../reusables/edit_task_sheet.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const tag = '/body';

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance;
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
              size: 30,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 9, top: 10),
                      child: IconButton(
                        tooltip: 'Log out',
                        onPressed: () {
                          context.router.pop();
                          user.signOut();
                        },
                        icon: const Icon(
                          Icons.logout_rounded,
                          size: 31,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: kPagePadding.copyWith(
                      top: 0,
                      bottom: 12,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Tasks',
                          style: TextStyle(
                            fontFamily: 'Asap',
                            fontWeight: FontWeight.w500,
                            fontSize: 45,
                            letterSpacing: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            user.currentUser!.email!,
                            style: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TaskList(),
                        ),
                      ],
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
