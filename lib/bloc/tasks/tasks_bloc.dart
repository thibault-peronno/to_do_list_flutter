import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_event.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_state.dart';
import 'package:to_do_list_flutter/models/task_model.dart';
import 'package:to_do_list_flutter/services/tasks_service.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<TasksLoadEvent>(_onTasksLoadEvent);
    on<NewTaskEvent>(_onNewTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
  }
}

void _onTasksLoadEvent(TasksLoadEvent event, Emitter<TasksState> emit) async {
  List<TaskModel> tasks = await TasksService.getTasks(event.userId);

  emit(TasksSuccessState(tasks: tasks));
}

void _onNewTaskEvent(NewTaskEvent event, Emitter<TasksState> emit) {
  emit(
    TasksState(newTask: event.task),
  );
}

void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter emit) async {
  print('update task');
  final updatedTask =
      await TasksService.updateTask(event.id, event.decription, event.isDone);
}
