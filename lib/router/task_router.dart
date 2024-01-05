import 'package:go_router/go_router.dart';
import 'package:to_do_list_flutter/pages/login_page.dart';
import 'package:to_do_list_flutter/pages/tasks_page.dart';

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
        builder: (context, state) => const TasksPage(),
      )
    ],
  );
}
