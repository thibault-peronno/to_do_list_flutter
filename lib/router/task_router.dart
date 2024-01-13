import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_bloc.dart';
import 'package:to_do_list_flutter/pages/login_page.dart';
import 'package:to_do_list_flutter/pages/profil_page.dart';
import 'package:to_do_list_flutter/pages/tasks_page.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_state.dart';

class TaskRouter {
  static String login = '/login';
  static String tasks = '/';
  static String profil = '/profil';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        name: 'login',
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'tasks',
        path: tasks,
        builder: (_, state) => const TasksPage(),
        redirect: (context, state) => _redirect(context),
      ),
      GoRoute(
        name: 'profil',
        path: profil,
        builder: (_, state) => const ProfilPage(),
        redirect: (context, state) => _redirect(context),
      )
    ],
  );

  static _redirect(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    return authState.isUserConnected ? null : "/login";
  }
}
