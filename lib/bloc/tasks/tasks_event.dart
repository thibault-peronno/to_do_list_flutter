import 'package:flutter/widgets.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class TasksLoadEvent extends TasksEvent {
  final int userId;

  const TasksLoadEvent({
    required this.userId,
  });
}

class AddNewTasKEvent extends TasksEvent {
  final String task;
  AddNewTasKEvent({required this.task});
}

class UpdateTaskEvent extends TasksEvent {
  final int id;
  final String description;
  final bool isDone;
  UpdateTaskEvent(this.id, this.isDone, this.description);
}

class DeleteTaskEvent extends TasksEvent {
  final int id;
  DeleteTaskEvent(this.id);
}
