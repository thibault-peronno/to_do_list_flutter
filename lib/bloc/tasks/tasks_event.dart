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

class UpdateTaskEvent extends TasksEvent {
  final int id;
  final String decription;
  final bool isDone;
  UpdateTaskEvent(this.id, this.isDone, this.decription);
}
