import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final int id;
  final String firstname;
  final String lastname;
  final String identifiant;

  const UserState({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.identifiant,
  });

  @override
  List<Object> get props => [id, firstname, lastname, identifiant];
}
