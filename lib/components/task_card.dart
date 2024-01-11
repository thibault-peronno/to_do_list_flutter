import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(task.description),
        value: task.isDone == 1 ? true : false,
        onChanged: (value) {
          task.isDone == 1 ? task.isDone = 0 : task.isDone = 1;
        },
      ),
    );
  }
}
