import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_event.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_state.dart';
import 'package:to_do_list_flutter/models/task_model.dart';
import 'package:to_do_list_flutter/services/tasks_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TasksState> emit) async {
  print('update task');

  try {
    final updatedTask = await TasksService.updateTask(
        event.id, event.description, event.isDone);

    if (updatedTask == 'true') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? id = prefs.getInt('userId');
      // the ! after id, check that variable is not nullable
      List<TaskModel> tasks = await TasksService.getTasks(id!);
      emit(TasksSuccessState(tasks: tasks));
    }
  } catch (error) {
    print('error : $error');
    // when we do the errors
    // emit(TasksErrorState(e.toString()));
  }
}
