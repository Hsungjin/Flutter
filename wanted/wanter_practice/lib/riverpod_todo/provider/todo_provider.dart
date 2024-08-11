import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanter_practice/riverpod_todo/provider/todo_list_provider.dart';

import '../model/todo.dart';

part 'todo_provider.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  TodoModel build(int id) {
    return ref.read(todoListProvider.notifier).getTodo(id);
  }
}