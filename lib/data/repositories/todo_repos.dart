import 'dart:convert';

import 'package:demo_flutter_bloc/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> getTodo() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((task) => TodoModel.fromJson(task))
          .toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }
}
