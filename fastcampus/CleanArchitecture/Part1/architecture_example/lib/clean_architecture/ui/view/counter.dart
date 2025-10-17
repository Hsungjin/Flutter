import 'package:architecture_example/clean_architecture/presentation/presentation.dart';
import 'package:architecture_example/clean_architecture/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// TODO: Clean Architecture 패턴을 적용하여 카운터 앱이 동작하도록 변경하세요.

class CleanArchitectureView extends StatelessWidget {
  final CounterViewModel counterViewModel;
  final CounterModeViewModel counterModeViewModel;

  const CleanArchitectureView({
    super.key,
    required this.counterViewModel,
    required this.counterModeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVC'),
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
            ValueListenableBuilder(
              valueListenable: counterViewModel.counter,
              builder: (context, value, child) => Text(
                value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: counterModeViewModel.counterMode,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: execute,
            child: Icon(value.icon),
          );
        },
      ),
    );
  }

  void onChangedMode() {
    counterModeViewModel.toggleMode();
  }

  void execute() {
    switch (counterModeViewModel.counterMode.value) {
      case CounterMode.plus:
        counterViewModel.increment();
      case CounterMode.minus:
        counterViewModel.decrement();
    }
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
