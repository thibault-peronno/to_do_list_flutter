import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_event.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_state.dart';
import 'package:to_do_list_flutter/models/task_model.dart';
import 'package:to_do_list_flutter/services/tasks_service.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<TasksLoadEvent>(_onTasksLoadEvent);
  }
}

void _onTasksLoadEvent(TasksLoadEvent event, Emitter<TasksState> emit) async {
  List<TaskModel> tasks =
      await TasksService.getTasks(event.userId, event.token);
}
