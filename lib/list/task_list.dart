import 'package:exercise6/reusables/task_tile.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> myTasks = [
      Todo(task: 'Wash the plates', id: 1),
      Todo(task: 'Wash the plates', id: 2),
      Todo(task: 'Wash the plates', id: 3),
      Todo(task: 'Wash the plates', id: 4),
      Todo(task: 'Wash the plates', id: 5),
      Todo(task: 'Wash the plates', id: 6),
    ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        physics: const BouncingScrollPhysics(),
      ),
      child: ListView.builder(
        itemCount: myTasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            item: myTasks[index],
          );
        },
      ),
    );
  }
}
