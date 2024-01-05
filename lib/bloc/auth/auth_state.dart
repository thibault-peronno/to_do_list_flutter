import 'package:equatable/equatable.dart';

/// this the auth state. Where we have some information to the connection user
class AuthState extends Equatable {
  final bool isUserConnected;
  final String token;

  const AuthState({
    required this.isUserConnected,
    required this.token,
  });

  @override
  List<Object> get props => [isUserConnected, token];
}
