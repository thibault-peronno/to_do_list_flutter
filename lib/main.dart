import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_bloc.dart';
import 'package:to_do_list_flutter/bloc/tasks/tasks_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_bloc.dart';
import 'router/task_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/pages/login_page.dart';
import 'package:to_do_list_flutter/pages/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<AuthBloc>(
    //   create: (context) => AuthBloc(),
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(),
        ),
        // Add more blocs as needed
      ],
      child: MaterialApp.router(
        title: 'to do list',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 36, 31, 83)),
          useMaterial3: true,
        ),
        // home: const LoginPage(),
        // home: const TasksPage(),
        routerConfig: TaskRouter.router,
      ),
    );
    // return MaterialApp.router(
    //     title: 'to do list',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(
    //           seedColor: const Color.fromARGB(255, 36, 31, 83)),
    //       useMaterial3: true,
    //     ),
    //     // home: const LoginPage(),
    //     // home: const TasksPage(),
    //     routerConfig: TaskRouter.router);
  }
}
