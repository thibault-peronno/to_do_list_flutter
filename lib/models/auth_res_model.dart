class AuthResModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String token;

  AuthResModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.token,
  });

  factory AuthResModel.fromJson(Map<String, dynamic> json) => AuthResModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        token: json['token'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'token': token,
      };
}
