import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_event.dart';
import 'package:to_do_list_flutter/bloc/user/user_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_state.dart';
import 'package:to_do_list_flutter/pages/widgets/navigation_bar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mon profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserState _:
                    BlocProvider.of<TasksBloc>(context)
                        .add(TasksLoadEvent(userId: state.id));
                    return Center(
                        child: Column(
                      children: [
                        Text(
                          "${state.firstname} ${state.lastname} ",
                        ),
                        const SizedBox(height: 10),
                        Text(state.identifiant)
                      ],
                    ));
                  // default:
                  //   return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarApp(context: context, page: 'profil'),
    );
  }
}
