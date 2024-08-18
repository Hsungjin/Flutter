import 'package:dio_example/model.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  final List<TodoModel> todos;

  const TodoListScreen({super.key, this.todos = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.completed ? 'Completed' : 'Not Completed'),
          );
        },
      ),
    );
  }
}
