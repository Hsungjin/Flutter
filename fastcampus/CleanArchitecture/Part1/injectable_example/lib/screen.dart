import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dependency.dart';
import 'model.dart';

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
        title: const Text('injectable_example'),
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
            Text('You have pushed the button this many times:'),
            Text(
              locator<CounterModel>().counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: excute,
        child: Icon(locator<CounterModeModel>().counterMode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      locator<CounterModeModel>().toggleMode();
    });
  }

  void excute() {
    setState(() {
      switch (locator<CounterModeModel>().counterMode) {
        case CounterMode.plus:
          locator<CounterModel>().increment();
          break;
        case CounterMode.minus:
          locator<CounterModel>().decrement();
          break;
      }
    });
  }
}

extension on CounterMode {
  IconData get icon {
    switch (this) {
      case CounterMode.plus:
        return CupertinoIcons.plus;
      case CounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
