abstract class TasksEvent {
  const TasksEvent();
}

class TasksLoadEvent extends TasksEvent {
  final int userId;

  const TasksLoadEvent({
    required this.userId,
  });
}

class NewTaskEvent extends TasksEvent {
  final String task;
  NewTaskEvent(this.task);
}
