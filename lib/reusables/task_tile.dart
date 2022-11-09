import 'package:exercise6/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../bloc/app_bloc.dart';
import '../model/task.dart';
import '../utils.dart';
import 'edit_task_sheet.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.item,
    Key? key,
  }) : super(key: key);

  final Todo item;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppBloc>(
      builder: (BuildContext context, data, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Dismissible(
            key: ObjectKey(item.id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              data.deleteTask(item: item);
              Utils.showSnackbar('Successfully deleted \'${item.task}\'');
            },
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
                onTap: () {
                  // Let the provider know which item is selected
                  data.selectedItem = item;
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: kRoundedBorder,
                    context: context,
                    builder: (context) => EditTaskSheet(
                      function: '/update',
                    ),
                  );
                },
                leading: RoundCheckBox(
                  checkedWidget: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 21,
                  ),
                  size: 26,
                  onTap: (bool? value) {
                    item.isDone = !item.isDone;
                    data.updateTask(item: item);
                  },
                  uncheckedColor: kScaffoldColor,
                  checkedColor: kGradientColor,
                  isChecked: item.isDone,
                ),
                title: Text(
                  item.task,
                  style: TextStyle(
                    fontSize: 18.5,
                    decoration: item.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.black.withOpacity(0.8),
                    decorationThickness: 3,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
