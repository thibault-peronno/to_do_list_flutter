// ignore_for_file: unnecessary_this

import 'package:to_do_list_flutter/bloc/auth/auth_event.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_bloc.dart';
import 'package:to_do_list_flutter/bloc/user/user_event.dart';
import 'package:to_do_list_flutter/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
            const AuthState(isUserConnected: false, email: "", password: "")) {
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthLogoutEvent>(_onAuthLogout);
    on<AuthEmailChanged>(_onAuthEmailChanged);
    on<AuthPasswordChanged>(_onAuthPasswordChanged);
  }

  _onAuthEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(
      AuthState(
        email: event.email,
        isUserConnected: this.state.isUserConnected,
        password: this.state.password,
        // token: this.state.token,
      ),
    );
  }

  _onAuthPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(
      AuthState(
        email: this.state.email,
        isUserConnected: this.state.isUserConnected,
        password: event.password,
        // token: this.state.token,
      ),
    );
  }

  void _onAuthLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    // to do the connection in auth service

    try {
      // Appellez votre service d'authentification pour effectuer la connexion - call the authentification service to set the connection
      final loginResponse = await AuthService.login(
        this.state.email,
        this.state.password,
      );
      print('loginResponse');
      print(loginResponse);

      // I retrieve the token in the shared prefernce storage
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token != '') {
        // Émettez un nouvel état qui indique que l'utilisateur est connecté - emit a new state to tell user connected.
        emit(
          const AuthState(
            isUserConnected: true,
            // token: loginResponse.token,
            email: '',
            password: '',
          ),
        );
        BlocProvider.of<UserBloc>(event.context).add(
          UserConnected(
            loginResponse.id,
            loginResponse.firstname,
            loginResponse.lastname,
            loginResponse.email,
          ),
        );
      }
      print('AuthState');
      print(AuthState);
    } catch (e) {
      // Gérez les erreurs de connexion ici
    }
  }

  void _onAuthLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await AuthService().logout();
      // Plus nécéssaire, puisque on listen les auth state change
      emit(const AuthState(isUserConnected: false, email: '', password: ''));
    } catch (error) {
      print('error log out : $error');
      emit(const AuthState(isUserConnected: false, email: '', password: ''));
    }
  }
}
