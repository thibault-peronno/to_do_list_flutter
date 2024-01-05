abstract class AuthEvent {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}
