import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

// TODO: Provider 를 사용하여 카운터 앱이 동작하도록 변경하세요.
// - 단, Screen 내에 변수는 없어야 한다. (ex. counterModel)

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('provider'),
        actions: [
          IconButton(
            onPressed: onChangedMode,
            icon: const Icon(CupertinoIcons.arrow_2_squarepath),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              context.read<CounterModel>().counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: Icon(context.read<CounterModeModel>().counterMode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      context.read<CounterModeModel>().toggleMode();
    });
  }

  void execute() {
    setState(() {
      switch (context.read<CounterModeModel>().counterMode) {
        case CounterMode.plus:
          context.read<CounterModel>().increment();
        case CounterMode.minus:
          context.read<CounterModel>().decrement();
      }
    });
  }
}

extension on CounterMode {
  IconData get icon {
    switch (this) {
      case CounterMode.plus:
        return CupertinoIcons.add;
      case CounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
