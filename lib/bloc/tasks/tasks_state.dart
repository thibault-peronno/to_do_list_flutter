import 'package:equatable/equatable.dart';
import 'package:to_do_list_flutter/models/task_model.dart';

class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object?> get props => [];
}

class TasksInitialState extends TasksState {}

class TasksSuccessState extends TasksState {
  final List<TaskModel> tasks;

  const TasksSuccessState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}
