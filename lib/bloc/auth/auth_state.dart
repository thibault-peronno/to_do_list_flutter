import 'package:equatable/equatable.dart';

/// this the auth state. Where we have some information to the connection user
class AuthState extends Equatable {
  final bool isUserConnected;
  // final String token;
  final String email;
  final String password;

  const AuthState(
      {required this.isUserConnected,
      // required this.token,
      required this.email,
      required this.password});

  @override
  List<Object> get props => [isUserConnected, email, password];
}
