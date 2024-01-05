import 'package:to_do_list_flutter/bloc/auth/auth_event.dart';
import 'package:to_do_list_flutter/bloc/auth/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState(isUserConnected: false, token: "")) {
    on<AuthLoginEvent>(_onAuthLogin);

    on<AuthLogoutEvent>(_onAuthLogout);
  }

  void _onAuthLogin(AuthLoginEvent event, Emitter<AuthState> emit) {
    //! to do the connection in a service
  }

  void _onAuthLogout(AuthLogoutEvent event, Emitter<AuthState> emit) {}
}
