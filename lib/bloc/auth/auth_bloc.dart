import 'package:to_do_list_flutter/bloc/auth/auth_event.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_flutter/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthState(
            isUserConnected: false, token: "", email: "", password: "")) {
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthLogoutEvent>(_onAuthLogout);
    on<AuthEmailChanged>(_onAuthEmailChanged);
    on<AuthPasswordChanged>(_onAuthPasswordChanged);
  }

  _onAuthEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(AuthState(
        email: event.email,
        isUserConnected: this.state.isUserConnected,
        password: this.state.password,
        token: this.state.token));
  }

  _onAuthPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(AuthState(
        email: this.state.email,
        isUserConnected: this.state.isUserConnected,
        password: event.password,
        token: this.state.token));
  }

  void _onAuthLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    // to do the connection in auth service

    try {
      // Appellez votre service d'authentification pour effectuer la connexion - call the authentification service to set the connection
      final loginResponse =
          await AuthService.login(this.state.email, this.state.password);

      // Émettez un nouvel état qui indique que l'utilisateur est connecté
      emit(const AuthState(
          isUserConnected: true, token: '', email: '', password: ''));
    } catch (e) {
      // Gérez les erreurs de connexion ici
    }
  }

  void _onAuthLogout(AuthLogoutEvent event, Emitter<AuthState> emit) {
    // to do logout in auth service

//     try {
//    // Appellez votre service d'authentification pour effectuer la déconnexion
//    await authService.logout();

//    // Émettez un nouvel état qui indique que l'utilisateur n'est plus connecté
//    emit(AuthState(isUserConnected: false, token: ""));
//  } catch (e) {
//    // Gérez les erreurs de déconnexion ici
//  }
  }
}
