import 'package:flutter/material.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthEmailChanged extends AuthEvent {
  final String email;
  AuthEmailChanged(this.email);
}

class AuthPasswordChanged extends AuthEvent {
  final String password;
  AuthPasswordChanged(this.password);
}

class AuthLoginEvent extends AuthEvent {
  final BuildContext context;
  AuthLoginEvent(this.context);
}

class AuthLogoutEvent extends AuthEvent {}
