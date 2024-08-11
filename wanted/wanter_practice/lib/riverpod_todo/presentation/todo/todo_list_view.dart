import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanter_practice/riverpod_todo/presentation/todo/todo_detail_screen.dart';
import 'package:wanter_practice/riverpod_todo/provider/todo_list_provider.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(todoListProvider);

    if (list.isEmpty) {
      return EmptyTodoListView();
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final todo = list[index];

        return ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => TodoDetailScreen(id: todo.id)),
          ),
          title: Text(todo.title),
          subtitle: Text(todo.status.toString()),
          trailing: IconButton(onPressed: () {
            ref.read(todoListProvider.notifier).progressTodo(todo.id);
          }, icon: Icon(Icons.play_arrow)),
        );
      },
    );
  }
}

class EmptyTodoListView extends StatelessWidget {
  const EmptyTodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No todos yet!'),
    );
  }
}
