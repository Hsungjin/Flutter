import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanter_practice/riverpod_todo/provider/todo_list_provider.dart';

class AddTodoScreen extends ConsumerWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Add TOdo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    ref.read(todoListProvider.notifier).addTodo(titleController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                )
              ],
            ),
          ),
        ));
  }
}
