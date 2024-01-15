import 'package:equatable/equatable.dart';
import 'package:to_do_list_flutter/models/task_model.dart';

class TasksState extends Equatable {
  final String? newTask;
  final Object? tasks;
  const TasksState({this.newTask, this.tasks});

  @override
  List<Object?> get props => [newTask];
}

class TasksInitialState extends TasksState {
  final String newTask;
  final Object tasks;
  const TasksInitialState({required this.newTask, required this.tasks});

  @override
  List<Object> get props => [newTask, tasks];
}

class TasksSuccessState extends TasksState {
  final List<TaskModel> tasks;

  const TasksSuccessState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class TasksErrorState extends TasksState {
  final String message;

  const TasksErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
