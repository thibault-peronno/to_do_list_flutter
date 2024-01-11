import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_state.dart';
import 'package:to_do_list_flutter/bloc/user/user_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_state.dart';
import 'package:to_do_list_flutter/components/task_card.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../bloc/tasks/tasks_event.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mes tâches'),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              switch (state) {
                case UserState _:
                  BlocProvider.of<TasksBloc>(context).add(
                      TasksLoadEvent(userId: state.id, token: authState.token));
                  return Center(
                    child: Text(
                      "Bonjour ${state.firstname} ${state.lastname}",
                    ),
                  );
                // default:
                //   return Center(child: CircularProgressIndicator());
              }
            },
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              switch (state) {
                case TasksInitialState _:
                  return const Text('Pas de tâche ?');
                case TasksSuccessState _:
                  return Column(
                    children: state.tasks
                        .map((task) => TaskCard(task: task))
                        .toList(),
                  );
                // return ListView.builder(
                //   itemCount: state.tasks.length,
                //   itemBuilder: (context, index) {
                //     return TaskCard(task: state.tasks[index]);
                //   },
                // );
                default:
                  return Container();
              }
            },
          ),
          // BlocListener<TasksBloc, TasksState>(
          //   listener: (context, state) {
          //     if (state.props != []) {
          //       const Text('text dans bloc listener task bloc');
          //     }
          //   },
          //   child: const Text('child text'),
          // )
        ],
      )),
    );
  }
}
