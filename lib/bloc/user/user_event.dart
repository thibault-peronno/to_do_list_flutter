abstract class UserEvent {
  const UserEvent();
}

class UserConnected extends UserEvent {
  final int id;
  final String firstname;
  final String lastname;
  final String identifiant;
  UserConnected(
    this.id,
    this.firstname,
    this.lastname,
    this.identifiant,
  );
}
