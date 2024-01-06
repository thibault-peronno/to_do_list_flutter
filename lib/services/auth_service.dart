import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_list_flutter/models/auth_res_model.dart';

class AuthService {
  static String baseUrl = '';

  static Future<AuthResModel> login(String email, String password) async {
    final http.Response response =
        await http.post(Uri.parse('$baseUrl/login-flutter'));

    // Check the status code of the response
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return AuthResModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Connexion échouée');
    }
  }
}
