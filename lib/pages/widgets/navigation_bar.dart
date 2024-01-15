import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({
    Key? key,
    required this.context,
    required this.page,
  }) : super(key: key);

  final String page;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.indigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(Icons.home, 'Home', '/'),
          _buildIconButton(Icons.account_circle_rounded, 'profil', '/profil'),
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutEvent());
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, String route) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, page == label ? 10 : 0),
        child: Icon(icon, color: Colors.white),
      ),
      onPressed: () => context.go(route),
    );
  }
}
