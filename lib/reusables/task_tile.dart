import 'package:exercise6/constants.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.item,
    Key? key,
  }) : super(key: key);

  final Todo item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Dismissible(
        key: ObjectKey(item.id),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {},
        background: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: const [
                  Icon(
                    Icons.delete_outline_outlined,
                    color: kShadowColor,
                    size: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 17.5,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 8,
          child: ListTile(
            title: Text(
              item.task,
              style: const TextStyle(fontSize: 18.5, letterSpacing: 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
