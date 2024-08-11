import 'package:flutter/material.dart';
import 'package:wanter_practice/riverpod_todo/presentation/todo/add_todo_screen.dart';
import 'package:wanter_practice/riverpod_todo/presentation/todo/todo_list_view.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Todo App'),
      ),
      body: TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTodoScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
