import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_state.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mes tâches'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text('page des tâches'),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserState _:
                    return Center(
                      child: Text(
                        "Bonjour ${state.firstname} ${state.lastname}",
                      ),
                    );
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
