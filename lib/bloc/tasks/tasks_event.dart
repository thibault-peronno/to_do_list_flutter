abstract class TasksEvent {
  const TasksEvent();
}

class TasksLoadEvent extends TasksEvent {
  final int userId;
  final String token;

  const TasksLoadEvent({
    required this.userId,
    required this.token,
  });
}

class NewTaskEvent extends TasksEvent {
  final String task;
  NewTaskEvent(this.task);
}
