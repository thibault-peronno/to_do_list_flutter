import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_event.dart';
import 'package:to_do_list_flutter/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    // we can not use read directly in the action onchanged or onPressed. Maybe others. So We create a variable before.
    final taskUpdate = context.read<TasksBloc>();
    print(taskUpdate);
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            title: Text(task.description),
            value: task.isDone == 1 ? true : false,
            onChanged: (value) {
              print(value);
              taskUpdate
                  .add(UpdateTaskEvent(task.id, value!, task.description));
              // value == true ? task.isDone = 1 : task.isDone = 0;
            },
          ),
        ),
        IconButton(
          onPressed: () {
            print('delete task $task');
          },
          icon: const Icon(Icons.delete_forever_rounded),
        ),
      ],
    );
  }
}
