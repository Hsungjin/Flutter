import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanter_practice/riverpod_todo/provider/todo_provider.dart';

class TodoDetailScreen extends ConsumerWidget {
  final int id;

  const TodoDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(todo.title),
            Text(todo.status.toString()),
            Text(todo.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}
