import 'package:dio/dio.dart';
import 'package:dio_example/model.dart';

final option = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
);

final dio = Dio(option);

class TodoRepository {
  final _dio = dio;
  
  Future<List<TodoModel>> getTodos() async {
    final todos = <TodoModel>[];
    final result = await _dio.get('/todos');

    result.data.forEach((todo) {
      todos.add(TodoModel.fromJson(todo));
    });

    return todos;
  }
}