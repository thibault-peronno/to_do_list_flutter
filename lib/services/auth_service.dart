import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_list_flutter/models/auth_res_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static String baseUrl = 'http://localhost:3000/api';

  static Future<AuthResModel> login(String email, String password) async {
    print('auth service');
    print(email);
    final http.Response response = await http.post(
      Uri.parse('$baseUrl/auth/login-mobil'),
      body: jsonEncode({'identifiant': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Body: ${response.body}');
      final responseBody = AuthResModel.fromJson(jsonDecode(response.body));
      final token = responseBody.token;
      final id = responseBody.id;
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setInt('userId', id);
      } catch (e) {
        print("Error saving token: $e");
      }
      // If the server returns a 200 OK response, parse the JSON.
      return responseBody;
    } else {
      print('error');
      print('Status Code: ${response.statusCode}');
      // print('Headers: ${response.headers}');
      // print('Body: ${response.body}');
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Connexion échouée');
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Supprime le token
  }
}
