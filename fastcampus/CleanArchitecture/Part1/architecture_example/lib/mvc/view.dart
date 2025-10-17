import 'package:architecture_example/mvc/model.dart';
import 'package:architecture_example/mvc/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: MVC 패턴을 적용하여 카운터 앱이 동작하도록 변경하세요.
// - 단, View 내에 변수는 없어야 한다. (ex. counter)

class MvcView extends StatefulWidget {
  final CounterController counterController;
  final CounterModeController counterModeController;

  const MvcView({
    super.key,
    required this.counterController,
    required this.counterModeController,
  });

  @override
  State<MvcView> createState() => _MvcViewState();
}

class _MvcViewState extends State<MvcView> {
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
            Text(
              widget.counterController.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: Icon(widget.counterModeController.counterMode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      widget.counterModeController.toggleMode();
    });
  }

  void execute() {
    setState(() {
      switch (widget.counterModeController.counterMode) {
        case CounterMode.plus:
          widget.counterController.increment();
        case CounterMode.minus:
          widget.counterController.decrement();
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
