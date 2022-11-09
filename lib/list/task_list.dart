import 'package:exercise6/list/extras/loading.dart';
import 'package:exercise6/reusables/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/app_bloc.dart';
import '../model/task.dart';
import 'extras/none_available.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBloc>(
      builder: (_, data, Widget? child) {
        return StreamBuilder(
          stream: data.readTasks(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Todo>> snapshot,
          ) {
            if (snapshot.hasError) {
              return NoneAvailable(
                message: 'Something went wrong! ${snapshot.error}',
              );
            } else if (!snapshot.hasData) {
              data.readTasks();
              return const Loading();
            } else {
              return snapshot.data!.isNotEmpty
                  ? ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false, // Remove the scroll bar by the side
                        physics:
                            const BouncingScrollPhysics(), // Create a bouncy scroll effect
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            Todo task = snapshot.data![index];
                            return TaskTile(
                              item: task,
                            );
                          },
                        ),
                      ),
                    )
                  : const NoneAvailable(
                      message: 'No current tasks',
                    ); // If the snapshots are empty
            }
          },
        );
      },
    );
  }
}
