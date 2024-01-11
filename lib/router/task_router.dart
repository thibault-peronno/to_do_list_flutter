import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_bloc.dart';
import 'package:to_do_list_flutter/pages/login_page.dart';
import 'package:to_do_list_flutter/pages/tasks_page.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_state.dart';

class TaskRouter {
  static String login = '/login';
  static String tasks = '/';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: tasks,
        builder: (_, state) => const TasksPage(),
        redirect: (context, state) => _redirect(context),
      )
    ],
  );

  static _redirect(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    return authState.isUserConnected ? null : "/login";
  }
}
