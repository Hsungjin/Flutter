import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';

class TodoApi implements TodoRepository<ApiError>{
  final client = Dio(BaseOptions(baseUrl: Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080'));

  TodoApi._();

  static TodoApi instance = TodoApi._();

  @override
  Future<SimpleResult<List<Todo>, ApiError>> getTodoList() async {
    return tryRequest(() async {
      final todoList = await client.get<List>('todos');
      return SimpleResult.success(todoList.data?.map((e) => Todo.fromJson(e)).toList() ?? []);
    }
  }
}