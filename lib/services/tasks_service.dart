import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:to_do_list_flutter/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksService {
  // static String baseUrl = 'http://localhost:3000/api/task';
  // when I virtualize the app on my own phone
  static String baseUrl = 'http://192.168.33.209:3000/api/task';

  static Future<List<TaskModel>> getTasks(int userId) async {
    print(userId);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/tasks/$userId'),
      // headers: {
      //   'Content-Type': 'application/json',
      //   HttpHeaders.authorizationHeader: 'Bearer $token',
      // },
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Status Code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map<TaskModel>((taskJsonData) => TaskModel.fromJson(taskJsonData))
          .toList();
    } else {
      print('error');
      print('Status Code: ${response.statusCode}');
      // print('Headers: ${response.headers}');
      // print('Body: ${response.body}');
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Connexion échouée');
    }
  }

  static Future<String> updateTask(
      int id, String description, bool isDone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(id);
    print(description);
    print(isDone);
    final http.Response response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          'id': id,
          'description': description,
          'isDone': isDone,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 204) {
      print('Ressource mise à jour avec succès');
      print(response.body);
      return 'true';
    } else {
      print('Erreur lors de la mise à jour de la ressource');
      throw Exception('Mise à jour échouée');
    }
  }

  static Future<String> deleteTask(id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final http.Response response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Ressource mise à jour avec succès');
      print(response.body);
      return 'true';
    } else {
      print('Erreur lors de la mise à jour de la ressource');
      throw Exception('Mise à jour échouée');
    }
  }

  static Future<String> addTask(task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? id = prefs.getInt('userId');

    final http.Response response = await http.post(
      Uri.parse('$baseUrl/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'user_id': id,
        'description': task,
        'isDone': false,
      }),
    );

    print(response.statusCode);
    if (response.statusCode == 201) {
      print('Ressource mise à jour avec succès');
      print(response.body);
      return 'true';
    } else {
      print('Erreur lors de l ajout de la ressource');
      throw Exception("L'ajout a echoué");
    }
  }
}
