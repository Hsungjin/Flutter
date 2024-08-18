import 'package:dio_example/presentation/todo_list_screen.dart';
import 'package:dio_example/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DioExample());
}

class DioExample extends StatelessWidget {
  const DioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DioExampleHome(),
    );
  }
}

class DioExampleHome extends StatelessWidget {
  const DioExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio example'),
      ),
      body: Center(
        child: ConnectionButton(),
      ),
    );
  }
}

class ConnectionButton extends StatefulWidget {
  const ConnectionButton({super.key});

  @override
  State<ConnectionButton> createState() => _ConnectionButtonState();
}

class _ConnectionButtonState extends State<ConnectionButton> {
  late bool isConnection;

  @override
  void initState() {
    super.initState();
    isConnection = false;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isConnection
            ? null
            : () async {
                if (isConnection) {
                  return;
                }

                setState(() {
                  isConnection = true;
                });

                await Future.delayed(const Duration(seconds: 3));

                final todos = await TodoRepository().getTodos();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TodoListScreen(todos: todos)));

                setState(() {
                  isConnection = false;
                });
              },
        child: Container(
            width: 200,
            height: 50,
            child: Center(
              child: isConnection
                  ? const CircularProgressIndicator()
                  : const Text('Make a request!'),
            )));
  }
}
