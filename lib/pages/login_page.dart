import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Connexion utilisateur'),
              const SizedBox(
                height: 20, // Creates vertical space
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  onChanged: (String value) async {
                    context.read<AuthBloc>().add(AuthEmailChanged(value));
                  },
                ),
              ),
              const SizedBox(
                height: 10, // Creates vertical space
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (String value) async {
                    context.read<AuthBloc>().add(AuthPasswordChanged(value));
                  },
                ),
              ),
              const SizedBox(
                height: 20, // Creates vertical space
              ),
              // with the BlocLister, we check the AuthState and if we have a change in your state, we "play" the conditioin if valid
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.isUserConnected) {
                    context.go('/');
                  }
                },
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginEvent());
                    },
                    child: const Text('Se connecter'),
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
