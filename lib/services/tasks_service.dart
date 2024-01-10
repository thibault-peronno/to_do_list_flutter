import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:to_do_list_flutter/models/task_model.dart';

class TasksService {
  static String baseUrl = 'http://localhost:3000/api/task';

  static Future<List<TaskModel>> getTasks(int userId, String token) async {
    print(userId);
    print(token);
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
}
