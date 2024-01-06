class AuthResModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;

  AuthResModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  factory AuthResModel.formJson(Map<String, dynamic> json) => AuthResModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
      };
}
