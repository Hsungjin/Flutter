import 'package:flutter/material.dart';
import '../provider.dart';
import 'home_counter.dart';

Counter counter = Counter();

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        // child: Text(_counter.toString()),
        child: HomeCounter(),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => counter.increment(counter: 5),
            tooltip: 'Increment Five',
            child: Text('+5'),
          )
        ],
      ),
    );
  }
}
